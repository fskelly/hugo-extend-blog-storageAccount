# #############################################################################
# File: SCSM_Load_Test.ps1
# 
# Author: Matthew Dowst, Catapult Systems
# Date:   07/02/2013
# 
# Purpose: This script will create multiple test incidents in Service Manager
#          based on the criteria supplied.
#
# Requirements: SMLets must be installed on the computer executing the script 
#
# Version History
# 1.0 - 07/02/2013 - Initial Version
#
# #############################################################################
 
# Enter the number of incidents to create
$IncCount = 25
# Enter the delay between incident creation in seconds
$delay = 10
 
###################################################
#                                                 #
#    DO NOT MAKE ANY CHANGES BELOW THIS LINE      #
#                                                 #
###################################################
 
# Import SMLets
import-module SMLets
 
# Display Start Time
$StartTime = get-date
Write-Host "Started"
Write-Host $StartTime
Write-Host "-------------------`n"
Write-Host "Created Incident ID"
Write-Host "-------------------"
$i =1
while ($i -le $IncCount) 
{ 
    # Get Random Properties
    $Class = Get-SCSMChildEnumeration -Enumeration (Get-SCSMEnumeration -name IncidentClassificationEnum$) | Get-Random 
    $Urgency = Get-SCSMChildEnumeration -Enumeration (Get-SCSMEnumeration -name System.WorkItem.TroubleTicket.UrgencyEnum$) | Get-Random 
    $Impact = Get-SCSMChildEnumeration -Enumeration (Get-SCSMEnumeration -name System.WorkItem.TroubleTicket.ImpactEnum$) | Get-Random 
    $TierQueue = Get-SCSMChildEnumeration -Enumeration (Get-SCSMEnumeration -name IncidentTierQueuesEnum$) | Get-Random 
    $Source = Get-SCSMChildEnumeration -Enumeration (Get-SCSMEnumeration -name IncidentSourceEnum$) | Get-Random 
    
    # Create Test Incidents
    $incidentclass = get-scsmclass -name system.workitem.incident$
    New-SCSMOBject -Class $incidentclass -PropertyHashtable (@{ID="IR{0}";
    Title = "Load Test $i";
    Urgency = $Urgency.name;
    Impact = $Impact.name;
    Classification = $Class.name;
    TierQueue = $TierQueue.name; 
    Source = $Source.name;
    Description = "Test please ignore";
    Status = "IncidentStatusEnum.Active"})
    
    # Display New Incident
    $Inc = Get-SCSMIncident -Title "Load Test $i" -CreatedAfter $StartTime
    Write-Host $Inc.ID " - " $Inc.Title 
    
    # Pause before creating next incident
    Start-Sleep -s $delay
    $i +=1
}
 
# Display End Time
Write-Host "-------------------`n"
$EndTime = get-date
Write-Host "Finished"
Write-Host $EndTime
#End of Script
