<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>sendingemail</fullName>
        <description>sendingemail</description>
        <protected>false</protected>
        <recipients>
            <recipient>app@stratus360labs.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SalesNewCustomerEmail</template>
    </alerts>
    <fieldUpdates>
        <fullName>updateinvoice</fullName>
        <description>update invoice approval action</description>
        <field>triggerupdatefield__c</field>
        <formula>&quot;3rdapprovalgive&quot;</formula>
        <name>updateinvoice</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
</Workflow>
