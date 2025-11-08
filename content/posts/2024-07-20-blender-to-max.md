+++
title = "Exporting from Blender to 3ds Max with Collision for Starfield"
date = 2024-07-20
tags = ["starfield", "mods", "tutorials", "blender", "3dsmax"]
+++

## From Blender

1. Build your mesh in Blender, and create the collision out of primitives, parent the collisions to the visible mesh

{{< image src="/images/2024-07-20-blender-to-max/blender_mesh_hierarchy.png" caption="Mesh Hierarchy in Blender w/ Collision" alt="Mesh Hierarchy in Blender w/ Collision" >}}

{{< image src="/images/2024-07-20-blender-to-max/blender_mesh_with_collision.png" caption="Mesh in Blender w/ Collision" >}}

{{< image src="/images/2024-07-20-blender-to-max/blender_mesh.png" caption="Mesh in Blender w/o Collision" >}}

2. Export as FBX, set scale to 1.0 if you're using cm in Blender, ensure **Up** is **Z up** and **Forward** is **Y Forward**

{{< image src="/images/2024-07-20-blender-to-max/blender_export_settings.png" caption="Blender Export Settings for 3ds Max" >}}

3. Import the fbx into 3ds Max 2021, if your units in max are set to cm, select automatic, otherwise adjust Units under **Advanced Options**

4. Open the Bethesda FBX Export tool, and create a new export for your mesh

{{< image src="/images/2024-07-20-blender-to-max/3ds_max_fbx_export.png" caption="Example of an FBX Export" >}}

5. Link the visible mesh you imported from Blender under the newly created empty in 3ds Max. **Make sure to keep the collisions linked to the visible mesh, not the empty**.

{{< image src="/images/2024-07-20-blender-to-max/3ds_max_mesh_hierarchy.png" caption="Mesh + Collision Hierarchy in 3ds Max" >}}

## Assigning Material

1. Open the Compact Material Editor in 3ds Max
   - Hit **M** and in the menu bar navigate to **Modes** --> **Compact Material Editor**

2. Click one of the empty/default materials, give it a name and next to the name field click **Physical Material** and select **BSBlinnLayeredMaterial**

{{< image src="/images/2024-07-20-blender-to-max/3ds_max_material.png" caption="Material Editor in 3ds Max" >}}

3. Scroll to the bottom of the material where it says **Please choose a .mat file by clicking on ... button** and click on **...**

4. Navigate to your material in the Data folder of Starfield and click **Open**

{{< image src="/images/2024-07-20-blender-to-max/3ds_max_material_path.png" caption=".mat Path in 3ds Max" >}}

5. Now drag the material from the **Material Editor** onto your visible mesh. It may be easier to hide the collisions during this step

{{< image src="/images/2024-07-20-blender-to-max/3ds_max_material_application.gif" caption="Applying the Material in 3ds Max" >}}

6. This will tell the exporter to tell write to the exported FBX where the .mat file is located

## Building Collisions

1. Now we need to add some Havok data to our visible mesh and its collisions

2. Select the visible model and collision then **Havok Content Tools** --> **Physics** --> **Create Rigid Body with Proxy(s)**

3. Ensure the scaling and origin for the visible model are correct

4. Ensure there's a **Rigid Body** modifier on the visible model and a **Havok Shape** on the collision

5. Reset XForms for both the visible model and collision

6. The modifiers should look like this:

{{< image src="/images/2024-07-20-blender-to-max/3ds_max_havok_modifiers.png" caption="Modifier on Visible Mesh" >}}

{{< image src="/images/2024-07-20-blender-to-max/3ds_max_havok_modifiers_collision.png" caption="Modifier on Collision Mesh" >}}

## Collision Material

Lastly we need to apply the collision material to the collisions. This will tell the game what bullet holes will look like, and how it sounds when impacted.

1. First we'll need to reconfigure the **Utilities** to show **Collision Groups**
   - Set **Total Buttons** to 9 (or if its not 8 already, just add one)
   - Click **Utilities** and **Edit button sets**

{{< image src="/images/2024-07-20-blender-to-max/3ds_max_configure_button_sets.png" caption="Configuring ButtonSets" >}}

   - Under **BGS Utility** drag **Collision Group** to the empty utility, name the new set something specific and click **Save** then click **OK**

{{< image src="/images/2024-07-20-blender-to-max/add_collisiongroup_utility.gif" caption="Adding the CollisionGroup" >}}

   - Open the **Collision Group** utility
   - Select your collision mesh you wish to apply the material to and set the material under **Default Material** and the **Object Type**

{{< image src="/images/2024-07-20-blender-to-max/collisiongroup_settings.png" caption="Collision Group Settings" >}}

2. Click **Apply To Selected**

{{< image src="/images/2024-07-20-blender-to-max/in_ck_example.png" caption="View of the Mesh/Collision in CreationKit" >}}
