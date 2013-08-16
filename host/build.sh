#!/bin/bash
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# clean target
if [ -d "$SCRIPT_DIR"/target ] ; then
    rm -rf "$SCRIPT_DIR"/target
fi
mkdir "$SCRIPT_DIR"/target
if [ ! -d "$SCRIPT_DIR"/dist ] ; then
    mkdir "$SCRIPT_DIR"/dist
fi

# unarchive virtual machine
echo "Unpacking VM"
#xz -kdf "$SCRIPT_DIR"/machines/"$VM_NAME".vdi.xz
#mv "$SCRIPT_DIR"/machines/"$VM_NAME".vdi "$SCRIPT_DIR"/target
cp "$SCRIPT_DIR"/machines/"$VM_NAME".vdi "$SCRIPT_DIR"/target

# create vm
VBoxManage createvm --name "$VM_NAME" --register --basefolder "$SCRIPT_DIR"/target >> "$SCRIPT_DIR"/build.log 2>&1
VBoxManage modifyvm "$VM_NAME" --ostype "$VM_OSTYPE" >> "$SCRIPT_DIR"/build.log 2>&1
VBoxManage modifyvm "$VM_NAME" --memory "$VM_MEMORY" >> "$SCRIPT_DIR"/build.log 2>&1
VBoxManage modifyvm "$VM_NAME" --nic1 bridged --bridgeadapter1 tap0 >> "$SCRIPT_DIR"/build.log 2>&1
VBoxManage modifyvm "$VM_NAME" --nictype1 "$VM_NICTYPE" >> "$SCRIPT_DIR"/build.log 2>&1
VBoxManage modifyvm "$VM_NAME" --macaddress1 "$VM_MACADDR" >> "$SCRIPT_DIR"/build.log 2>&1
VBoxManage modifyvm "$VM_NAME" --cpus 1 >> "$SCRIPT_DIR"/build.log 2>&1
VBoxManage modifyvm "$VM_NAME" --audio none >> "$SCRIPT_DIR"/build.log 2>&1
VBoxManage modifyvm "$VM_NAME" --usb off >> "$SCRIPT_DIR"/build.log 2>&1
VBoxManage modifyvm "$VM_NAME" --ioapic "$VM_IOAPIC" >> "$SCRIPT_DIR"/build.log 2>&1
VBoxManage setextradata global GUI/SuppressMessages remindAboutAutoCapture,remindAboutMouseIntegrationOn,showRuntimeError.warning.HostAudioNotResponding,remindAboutGoingSeamless,remindAboutInputCapture,remindAboutGoingFullscreen,remindAboutMouseIntegrationOff,confirmGoingSeamless,confirmInputCapture,remindAboutPausedVMInput,confirmVMReset,confirmGoingFullscreen,remindAboutWrongColorDepth >> "$SCRIPT_DIR"/build.log 2>&1
VBoxManage storagectl "$VM_NAME" --name "IDE" --add ide >> "$SCRIPT_DIR"/build.log 2>&1
VBoxManage internalcommands sethduuid "$SCRIPT_DIR"/target/$VM_NAME.vdi >> "$SCRIPT_DIR"/build.log 2>&1
VBoxManage storageattach "$VM_NAME" --storagectl "IDE" --port 0 --device 0 --type hdd --medium "$SCRIPT_DIR"/target/"$VM_NAME".vdi >> "$SCRIPT_DIR"/build.log 2>&1

# run virtual machine
VBoxManage startvm "$VM_NAME" --type headless >> "$SCRIPT_DIR"/build.log 2>&1

# wait for vm to start
set +e
ssh "$VM_ADDRESS" "ls" > /dev/null 2>&1
while [ $? -ne 0 ]; do
    echo "Waiting for VM ..."
    sleep 10
    ssh "$VM_ADDRESS" "ls" > /dev/null 2>&1
done
echo "VM started"
set -e

# enable logger
ssh "$VM_ADDRESS" "cd "$VM_OBF_DIR" && echo 'Starting build' > build.log"
nohup ssh "$VM_ADDRESS" "tail -f "$VM_OBF_DIR"/build.log | ssh 192.168.42.2 'cat >> "$SCRIPT_DIR"/build.log'" >> "$SCRIPT_DIR"/build.log 2>&1 &
LOGGER_PID="$!"

# do work
scp "$SCRIPT_DIR"/oub.zip "$VM_ADDRESS":"$VM_OBF_DIR"
scp "$SCRIPT_DIR"/openjdk.zip "$VM_ADDRESS":"$VM_OBF_DIR"
ssh "$VM_ADDRESS" "cd "$VM_OBF_DIR" && "$VM_UNZIP" -q oub.zip >> build.log 2>&1"
ssh "$VM_ADDRESS" "cd "$VM_OBF_DIR" && "$VM_UNZIP" -q openjdk.zip >> build.log 2>&1"
ssh "$VM_ADDRESS" "cd "$VM_OBF_DIR" && "$VM_START_BUILD""

# wait for build to finish
set +e
ssh "$VM_ADDRESS" "if [ ! -f "$VM_OBF_DIR"/build_finished.flag ]; then exit 1; else exit 0; fi" > /dev/null 2>&1
while [ $? -ne 0 ]; do
    echo "Waiting for build ..."
    sleep 10
ssh "$VM_ADDRESS" "if [ ! -f "$VM_OBF_DIR"/build_finished.flag ]; then exit 1; else exit 0; fi" > /dev/null 2>&1
done
set -e
echo "Build finished, checking exit status ..."

# check finished status 
scp "$VM_ADDRESS":"$VM_OBF_DIR"/build_finished.flag "$SCRIPT_DIR"/target
# string comparison fail workaround
if [ "" != "$( grep error "$SCRIPT_DIR"/target/build_finished.flag )" ]; then 
    echo "Build error"
    exit 1
fi

echo "Build returned success status, copying bundles ..."
scp -r "$VM_ADDRESS":"$VM_OBF_DIR"/dist/* "$SCRIPT_DIR"/dist

# connect to VM
#ssh $VM_ADDRESS

# shutdown and unregister vm
echo "Bundles copied, stopping VM ..."
kill -9 $LOGGER_PID >> "$SCRIPT_DIR"/build.log 2>&1
ssh "$VM_ADDRESS" "$VM_SHUTDOWN" >> "$SCRIPT_DIR"/build.log 2>&1 || true
sleep 5
VBoxManage controlvm "$VM_NAME" poweroff > /dev/null 2>&1 || true
VBoxManage unregistervm "$VM_NAME" >> "$SCRIPT_DIR"/build.log
echo "VM unregistered"
