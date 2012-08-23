/* This software is published under the BSD license                          */
/* as listed below.                                                          */
/*                                                                           */
/* Copyright (c) 2004-2007, OMEX AG, Switzerland                             */
/* All rights reserved.                                                      */
/*                                                                           */
/* Redistribution and use in source and binary forms, with or without        */
/* modification, are permitted provided that the following conditions        */
/* are met:                                                                  */
/*                                                                           */
/* * Redistributions of source code must retain the above copyright          */
/* notice, this list of conditions and the following disclaimer.             */
/*                                                                           */
/* * Redistributions in binary form must reproduce the above copyright       */
/* notice, this list of conditions and the following disclaimer in           */
/* the documentation and/or other materials provided with the                */
/* distribution.                                                             */
/*                                                                           */
/* * Neither the name of OMEX AG nor the names of the contributors           */
/* to openMDX may be used to endorse or promote products derived             */
/* from this software without specific prior written permission              */
/*                                                                           */
/* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND                    */
/* CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,               */
/* INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF                  */
/* MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE                  */
/* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS         */
/* BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,                  */
/* EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED           */
/* TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,             */
/* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON         */
/* ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,           */
/* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY            */
/* OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE                   */
/* POSSIBILITY OF SUCH DAMAGE.                                               */
/*                                                                           */
/* ------------------                                                        */
/*                                                                           */
/* This product includes software developed by the Apache Software           */
/* Foundation (http://www.apache.org/).                                      */
/*                                                                           */
CREATE TABLE prefs_Preference(
    object_rid varchar(100) NOT NULL,
    object_oid varchar(200) NOT NULL,
    object_idx integer NOT NULL,
    object__class varchar(100) NULL,
    name varchar(100) NULL,
    description varchar(100) NULL,
    absolute_path varchar(200) NULL,
    parent varchar(100) NULL,
    string_value text NULL,
    integer_value integer NULL,
    boolean_value varchar(10) NULL,
    uri_value varchar(200) NULL,
    decimal_value decimal(18,9) NULL,
    PRIMARY KEY (object_rid, object_oid, object_idx)
);

CREATE TABLE OOM0BASE_AUTHORITY (AUTHORITY_ID VARCHAR(256) NOT NULL, DTYPE VARCHAR(256), PRIMARY KEY (AUTHORITY_ID));
CREATE TABLE OOM0BASE_PROVIDER (PROVIDER_ID VARCHAR(256) NOT NULL, DTYPE VARCHAR(256), AUTHORITY VARCHAR(256), PRIMARY KEY (PROVIDER_ID));
CREATE TABLE OOMEP1WS_PROJECT (OBJECT_ID VARCHAR(256) NOT NULL, CREATED_AT ABSTIME, CREATED_BY_ INTEGER DEFAULT -1, DESCRIPTION VARCHAR(256), MODIFIED_BY_ INTEGER DEFAULT -1, NAME VARCHAR(256), DTYPE VARCHAR(256), MODIFIED_AT ABSTIME, MANAGER VARCHAR(256), P$$PARENT VARCHAR(256), PRIMARY KEY (OBJECT_ID));
CREATE TABLE OOMEP1WS_PROJECT_ (OBJECT_ID VARCHAR(256) NOT NULL, IDX INTEGER NOT NULL, CREATED_BY VARCHAR(256), MODIFIED_BY VARCHAR(256), DTYPE VARCHAR(256), PRIMARY KEY (OBJECT_ID, IDX));
CREATE TABLE OOMEP1WS_SEGMENT (SEGMENT_ID VARCHAR(256) NOT NULL, DESCRIPTION VARCHAR(256), DTYPE VARCHAR(256), PROVIDER VARCHAR(256), PRIMARY KEY (SEGMENT_ID));
CREATE TABLE OOMEP1WS_SEGMENT_ (OBJECT_ID VARCHAR(256) NOT NULL, IDX INTEGER NOT NULL, DTYPE VARCHAR(256), PRIMARY KEY (OBJECT_ID, IDX));
CREATE TABLE OOMEP1WS_SKILL (OBJECT_ID VARCHAR(256) NOT NULL, CREATED_AT ABSTIME, CREATED_BY_ INTEGER DEFAULT -1, MODIFIED_BY_ INTEGER DEFAULT -1, NAME VARCHAR(256), DTYPE VARCHAR(256), MODIFIED_AT ABSTIME, P$$PARENT VARCHAR(256), PRIMARY KEY (OBJECT_ID));
CREATE TABLE OOMEP1WS_SKILL_ (OBJECT_ID VARCHAR(256) NOT NULL, IDX INTEGER NOT NULL, CREATED_BY VARCHAR(256), MODIFIED_BY VARCHAR(256), DTYPE VARCHAR(256), PRIMARY KEY (OBJECT_ID, IDX));
CREATE TABLE OOMEP1WS_TASK (OBJECT_ID VARCHAR(256) NOT NULL, CREATED_AT ABSTIME, CREATED_BY_ INTEGER DEFAULT -1, DEFINITION VARCHAR(256), MODIFIED_BY_ INTEGER DEFAULT -1, NAME VARCHAR(256), SKILL_ INTEGER DEFAULT -1, DTYPE VARCHAR(256), MODIFIED_AT ABSTIME, P$$PARENT VARCHAR(256), PRIMARY KEY (OBJECT_ID));
CREATE TABLE OOMEP1WS_TASK_ (OBJECT_ID VARCHAR(256) NOT NULL, IDX INTEGER NOT NULL, CREATED_BY VARCHAR(256), MODIFIED_BY VARCHAR(256), DTYPE VARCHAR(256), SKILL VARCHAR(256), PRIMARY KEY (OBJECT_ID, IDX));
CREATE TABLE OOMEP1WS_TEAMMEMBER (OBJECT_ID VARCHAR(256) NOT NULL, CREATED_AT ABSTIME, CREATED_BY_ INTEGER DEFAULT -1, MODIFIED_BY_ INTEGER DEFAULT -1, NAME VARCHAR(256), SECURITY_NUMBER VARCHAR(256), SKILL_ INTEGER DEFAULT -1, DTYPE VARCHAR(256), MODIFIED_AT ABSTIME, P$$PARENT VARCHAR(256), PRIMARY KEY (OBJECT_ID));
CREATE TABLE OOMEP1WS_TEAMMEMBERASSIGNMENT (OBJECT_ID VARCHAR(256) NOT NULL, CREATED_AT ABSTIME, CREATED_BY_ INTEGER DEFAULT -1, MEMBER_ROLE VARCHAR(256), MODIFIED_BY_ INTEGER DEFAULT -1, DTYPE VARCHAR(256), MODIFIED_AT ABSTIME, P$$PARENT VARCHAR(256), TEAM_MEMBER VARCHAR(256), PRIMARY KEY (OBJECT_ID));
CREATE TABLE OOMEP1WS_TEAMMEMBERASSIGNMENT_ (OBJECT_ID VARCHAR(256) NOT NULL, IDX INTEGER NOT NULL, CREATED_BY VARCHAR(256), MODIFIED_BY VARCHAR(256), DTYPE VARCHAR(256), PRIMARY KEY (OBJECT_ID, IDX));
CREATE TABLE OOMEP1WS_TEAMMEMBER_ (OBJECT_ID VARCHAR(256) NOT NULL, IDX INTEGER NOT NULL, CREATED_BY VARCHAR(256), MODIFIED_BY VARCHAR(256), DTYPE VARCHAR(256), SKILL VARCHAR(256), PRIMARY KEY (OBJECT_ID, IDX));

