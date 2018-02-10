<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Confirmation_Email_Registration</fullName>
        <description>Send Confirmation Email Registration</description>
        <protected>false</protected>
        <recipients>
            <field>Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>BlueBerryEvents_Email/EventRegistration</template>
    </alerts>
    <fieldUpdates>
        <fullName>UpdateUniqueValues</fullName>
        <description>Update the field checkifUnique to Id&apos;s of Blueberry Event and Contact Object</description>
        <field>checkifunique__c</field>
        <formula>Contact__r.Id  &amp;  BlueBerryEvent__r.Id</formula>
        <name>UpdateUniqueValues</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>BlueBerryRestrictUniqueContributorsOnly</fullName>
        <actions>
            <name>UpdateUniqueValues</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>BlueBerryEventRegistration__c.Attendee_Email__c</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <description>Restrict Unique Users per Events (Rule will not allow same user for different session as well)</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>RegistrationEmailConfirmation</fullName>
        <actions>
            <name>Send_Confirmation_Email_Registration</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>BlueBerryEventRegistration__c.Name</field>
            <operation>notEqual</operation>
            <value>null</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
