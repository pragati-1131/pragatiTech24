trigger AccountTrigger on Account (after insert)
{
    InsertionDetails.createPersonDetails(trigger.new);

}