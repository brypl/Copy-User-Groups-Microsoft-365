import-module AzureAD

Connect-AzureAD

$copyuser = Read-Host "Enter the email of the user you want to copy "
$newuser = Read-Host "Enter the email of the user you want groups copied to "
$usermemberships = Get-AzureADUsermembership -ObjectId $copyuser 
$newuserRefObjectID = Get-AzureADUser -ObjectId $newuser


foreach ($groups in $usermemberships.ObjectID) {

Add-AzureADGroupMember -ObjectId $groups -RefObjectId $newuserRefObjectID.ObjectId

}