---
layout: post
title: Exporting from Blender to 3ds Max with Collision for Starfield
categories: [starfield, mods, tutorials]
tags: [starfield, mods, tutorials, blender, 3dsmax]
---

## From Blender
<ol>
	<li>Build your mesh in Blender, and create the collision out of primitives, parent the collisions to the visible mesh

{% include image.html url="/media/2024-07-20-blender-to-max/blender_mesh_hierarchy.png" caption="Mesh Hierarchy in Blender w/ Collision" alt="Mesh Hierarchy in Blender w/ Collision" %}

{% include image.html url="/media/2024-07-20-blender-to-max/blender_mesh_with_collision.png" caption="Mesh in Blender w/ Collision" %}

{% include image.html url="/media/2024-07-20-blender-to-max/blender_mesh.png" caption="Mesh in Blender w/o Collision" %}</li>
   
	<li>Export as FBX, set scale to 1.0 if you're using cm in Blender, ensure <b>Up</b> is <b>Z up</b> and <b>Forward</b> is <b>Y Forward</b>
{% include image.html url="/media/2024-07-20-blender-to-max/blender_export_settings.png" caption="Blender Export Settings for 3ds Max" %}</li>

	<li>Import the fbx into 3ds Max 2021, if your units in max are set to cm, select automatic, otherwise adjust Units under <b>Advanced Options</b></li>
	
	<li>Open the Bethesda FBX Export tool, and create a new export for your mesh</li>
	{% include image.html url="/media/2024-07-20-blender-to-max/3ds_max_fbx_export.png" caption="Example of an FBX Export" %}

	<li>Link the visible mesh you imported from Blender under the newly created empty in 3ds Max. <b>Make sure to keep the collisions linked to the visible mesh, not the empty</b>.

	{% include image.html url="/media/2024-07-20-blender-to-max/3ds_max_mesh_hierarchy.png" caption="Mesh + Collision Hierarchy in 3ds Max" %}</li>
	
</ol>

## Assigning Material
<ol>
	<li>Open the Compact Material Editor in 3ds Max
	1. Hit <b>M</b> and in the menu bar navigate to <b>Modes</b> --> <b>Compact Material Editor</b>
	</li>
	<li>Click one of the empty/default materials, give it a name and next to the name field click <b>Physical Material</b> and select <b>BSBlinnLayeredMaterial</b></li>
   
{% include image.html url="/media/2024-07-20-blender-to-max/3ds_max_material.png" caption="Material Editor in 3ds Max" %}

	<li>Scroll to the bottom of the material where it says <b>Please choose a .mat file by clicking on ... button</b> and click on <b>...</b></li>
	
	<li>Navigate to your material in the Data folder of Starfield and click <b>Open</b></li>
	{% include image.html url="/media/2024-07-20-blender-to-max/3ds_max_material_path.png" caption=".mat Path in 3ds Max" %}
	
	<li>Now drag the material from the <b>Material Editor</b> onto your visible mesh. It may be easier to hide the collisions during this step</li>
	{% include image.html url="/media/2024-07-20-blender-to-max/3ds_max_material_application.gif" caption="Applying the Material in 3ds Max" %}
	
	<li>This will tell the exporter to tell write to the exported FBX where the .mat file is located</li>
</ol>

## Building Collisions
<ol>
	<li>Now we need to add some Havok data to our visible mesh and its collisions</li>
	<li>Select the visible model and collision then <b>Havok Content Tools</b> --> <b>Physics</b> --> <b>Create Rigid Body with Proxy(s)</b></li>
	<li>Ensure the scaling and origin for the visible model are correct</li>
	<li>Ensure there's a <b>Rigid Body</b> modifier on the visible model and a <b>Havok Shape</b> on the collision</li>
	<li>Reset XForms for both the visible model and collision</li>
	<li>The modifiers should look like this:</li>
	{% include image.html url="/media/2024-07-20-blender-to-max/3ds_max_havok_modifiers.png" caption="Modifier on Visible Mesh" %}
	{% include image.html url="/media/2024-07-20-blender-to-max/3ds_max_havok_modifiers_collision.png" caption="Modifier on Collision Mesh" %}
</ol>

## Collision Material
Lastly we need to apply the collision material to the collisions. This will tell the game what bullet holes will look like, and how it sounds when impacted.

<ol>
	<li>
		First we'll need to reconfigure the <b>Utilities</b> to show <b>Collision Groups</b>
		<ol>
			<li>Set <b>Total Buttons</b> to 9 (or if its not 8 already, just add one)</li>
			<li>Click <b>Utilities</b> and <b>Edit button sets</b></li>
			{% include image.html url="/media/2024-07-20-blender-to-max/3ds_max_configure_button_sets.png" caption="Configuring ButtonSets" %}
			<li>Under <b>BGS Utility</b> drag <b>Collision Group</b> to the empty utility, name the new set something specific and click <b>Save</b> then click <b>OK</b></li>
			{% include image.html url="/media/2024-07-20-blender-to-max/add_collisiongroup_utility.gif" caption="Adding the CollisionGroup" %}
			<li>Open the <b>Collision Group</b> utility</li>
			<li>Select your collision mesh you wish to apply the material to and set the material under <b>Default Material</b> and the <b>Object Type</b></li>
			{% include image.html url="/media/2024-07-20-blender-to-max/collisiongroup_settings.png" caption="Collision Group Settings" %}
		</ol>
	</li>
	<li>Click <b>Apply To Selected</b></li>
	{% include image.html url="/media/2024-07-20-blender-to-max/in_ck_example.png" caption="View of the Mesh/Collision in CreationKit" %}
</ol>