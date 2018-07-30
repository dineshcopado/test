trigger AccountAddressTrigger on Account (before insert, before update) {

AccountAddressTriggerHelper.updateAccountAddress(trigger.new);

}