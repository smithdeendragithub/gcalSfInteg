Trigger Attachment_clone on Attachment(before insert){
    Attachment[] newattach = Trigger.new;
    TestingClass.cloneattachment(newattach);
}