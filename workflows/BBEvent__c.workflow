<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>archiveevent</fullName>
        <description>Update status of event to archive</description>
        <field>Status__c</field>
        <literalValue>Archived</literalValue>
        <name>archiveevent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>updatestatusasarchived</fullName>
        <description>Update the status of event as archived when it is 30days old from start date</description>
        <field>Status__c</field>
        <literalValue>Archived</literalValue>
        <name>updatestatusasarchived</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
</Workflow>
