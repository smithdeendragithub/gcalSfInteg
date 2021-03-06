<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Lineitem_mail</fullName>
        <description>Lineitem_mail</description>
        <protected>false</protected>
        <recipients>
            <recipient>app@stratus360labs.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>smithdeendra@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SalesNewCustomerEmail</template>
    </alerts>
    <fieldUpdates>
        <fullName>Copy_Unit_price</fullName>
        <description>copy the unit price of the item</description>
        <field>Unit_Price__c</field>
        <formula>Merchandise__r.Base_Currency__c</formula>
        <name>Copy Unit price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>justlikethat</fullName>
        <field>Quantity__c</field>
        <formula>Quantity__c + 2</formula>
        <name>justlikethat</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>resetfield</fullName>
        <field>Unit_Price__c</field>
        <formula>Merchandise__r.Base_Currency__c</formula>
        <name>resetfield</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_stock_inventory</fullName>
        <field>Quantity__c</field>
        <formula>Merchandise__r.Quantity__c  -  Quantity__c</formula>
        <name>update stock inventory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Merchandise__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Smith_lineitem_course3</fullName>
        <actions>
            <name>update_stock_inventory</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Invoice__c.Status__c</field>
            <operation>equals</operation>
            <value>Open</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Unitprice_autopopulate</fullName>
        <actions>
            <name>Copy_Unit_price</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Line_Item__c.Quantity__c</field>
            <operation>greaterOrEqual</operation>
            <value>1</value>
        </criteriaItems>
        <description>Populates the Line
Item object’s Unit Price field with the value of the Merchandise object’s Price
field.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>testingrule</fullName>
        <actions>
            <name>justlikethat</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Line_Item__c.CreatedDate</field>
            <operation>lessThan</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>checkingrule</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <timeLength>30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
