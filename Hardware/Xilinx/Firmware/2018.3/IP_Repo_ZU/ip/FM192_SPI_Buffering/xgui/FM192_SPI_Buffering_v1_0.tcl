# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_static_text $IPINST -name "Description" -parent ${Page_0} -text {Assert the input "flag" accordingly:
-"0" if SPI1_CS2 is desired to be connected to SPI1_CS2
-"1" if SPI1_CS2 is desired to be connected to SPI1_CS3}


}


