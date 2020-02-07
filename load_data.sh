#!/bin/bash
export PATH=/opt/lift-cli/bin:$PATH
UserID=$1
password=$2
hostname=$3
schema=$4
echo "This script is running, it will take a couple of minutes ..."

lift put --file MMData/"*".csv --target-user $UserID --target-password $password --target-host $hostname 
lift load --filename ACLED.csv --target-schema $schema --target-table ACLED --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename corruption.csv --target-schema $schema --target-table CORRUPTION --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename displacement.csv --target-schema $schema --target-table DISPLACEMENT --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename emdat.csv --target-schema $schema --target-table EMDAT --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename FIW.csv --target-schema $schema --target-table FIW --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename FragileStates.csv --target-schema $schema --target-table FRAGILESTATES --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename HumanRights.csv --target-schema $schema --target-table HUMANRIGHTS --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename mixedmigration.csv --target-schema $schema --target-table MIXEDMIGRATION --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename PoliticalTerror.csv --target-schema $schema --target-table POLITICALTERROR --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename Polity.csv --target-schema $schema --target-table POLITIY --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename SystemicPeace.csv --target-schema $schema --target-table SYSTEMICPEACE --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename target.csv --target-schema $schema --target-table TARGET --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename UN.csv --target-schema $schema --target-table UN --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename UNHCR.csv --target-schema $schema --target-table UNHCR --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename VDem.csv --target-schema $schema --target-table VDEM --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename WFP.csv --target-schema $schema --target-table WFP --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename WHO.csv --target-schema $schema --target-table WHO --target-user $UserID --target-password $password --target-host $hostname --file-origin user

lift load --filename worldbank.csv --target-schema $schema --target-table WORLDBANK --target-user $UserID --target-password $password --target-host $hostname --file-origin user

rm -r r*