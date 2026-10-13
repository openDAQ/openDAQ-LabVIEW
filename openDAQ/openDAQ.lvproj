<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="20008000">
	<Property Name="NI.LV.All.SaveVersion" Type="Str">20.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name=".Documentation" Type="Folder" URL="../.Documentation">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name=".Resources" Type="Folder" URL="../.Resources">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Binaries" Type="Folder" URL="../Binaries">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Examples" Type="Folder">
			<Property Name="NI.SortType" Type="Int">0</Property>
			<Item Name="Discover Devices.vi" Type="VI" URL="../Examples/Discover Devices.vi"/>
			<Item Name="Filter and Connect Device.vi" Type="VI" URL="../Examples/Filter and Connect Device.vi"/>
			<Item Name="Get Signals.vi" Type="VI" URL="../Examples/Get Signals.vi"/>
			<Item Name="MultiReader.lvlib" Type="Library" URL="../Examples/MultiReader/MultiReader.lvlib"/>
			<Item Name="Overall Example.vi" Type="VI" URL="../Examples/Overall Example.vi"/>
			<Item Name="Property Editor.lvlib" Type="Library" URL="../Examples/Property Editor/Property Editor.lvlib"/>
			<Item Name="StreamReader.lvlib" Type="Library" URL="../Examples/StreamReader/StreamReader.lvlib"/>
			<Item Name="TreeTraversal.lvlib" Type="Library" URL="../Examples/TreeTraversal/TreeTraversal.lvlib"/>
		</Item>
		<Item Name="Tests" Type="Folder">
			<Item Name="Class creation memory test.vi" Type="VI" URL="../Tests/Class creation memory test.vi"/>
		</Item>
		<Item Name="openDAQ.lvlib" Type="Library" URL="../openDAQ.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
