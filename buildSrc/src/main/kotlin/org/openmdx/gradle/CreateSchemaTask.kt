/*
 * ====================================================================
 * Project:     openMDX, http://www.openmdx.org/
 * Description: GenerateModelsTask
 * Owner:       OMEX AG, Switzerland, http://www.omex.ch
 * ====================================================================
 *
 * This software is published under the BSD license as listed below.
 * 
 * Copyright (c) 2020-2021, OMEX AG, Switzerland
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or
 * without modification, are permitted provided that the following
 * conditions are met:
 * 
 * * Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * 
 * * Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in
 *   the documentation and/or other materials provided with the
 *   distribution.
 * 
 * * Neither the name of the openMDX team nor the names of its
 *   contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
 * CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 * 
 * ------------------
 * 
 * This product includes software developed by other organizations as
 * listed in the NOTICE file.
 */
package org.openmdx.gradle

import org.gradle.api.DefaultTask
import org.gradle.api.tasks.InputFiles
import java.io.File
import org.gradle.kotlin.dsl.*

open class CreateSchemaTask : DefaultTask() {

    @get:InputFiles
	var tools = project.getConfigurations().getByName("tools")

	init {
		doLast {
			project.mkdir(File(project.getBuildDir(), "generated/sources/sql"))
			ant.withGroovyBuilder {
				"taskdef"(
					"name" to "mappingtool",
		 			"classname" to "org.apache.openjpa.jdbc.ant.MappingToolTask",
		  			"classpath" to tools.asPath
		  		)
				"mappingtool"(
					"action" to "buildSchema",
					"schemaFile" to File(project.getBuildDir(), "generated/sources/sql/openjpa-schema.xml"),
					"classpath" to tools.asPath
				) {
					"config"(
						"propertiesFile" to "etc/openjpa/" + project.property("database.name") + "-persistence.xml"
					)
				}
			}
		}
	}
	
}
