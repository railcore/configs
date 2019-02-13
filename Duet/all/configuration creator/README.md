 How to use the Railcore Duet configurator
 
 * go to the old/v1 [official RepRapFirmware Configuration Tool](https://configurator.reprapfirmware.org/v1/)
 * select “use existing configuration”
 * it'll prompt to upload a file, point it to the “railcore-config.json” file you saved.
 * Go through the configurator with many pre-set values for the Railcore 300ZL

There are a few caveats at this time.

 * This is currently untested - The M584 to Map Z to drivers 5, 6, 7, can only be placed in the custom section at the end
so how it will act defining Z (and the extruders) before the remap is unknown.
 * the M566 commands are converted from mm/sec by the configurator and multiplies by 60. If the figure required is not divisible by 60 then you can end up with a fraction. e.g. the max instant change can't be exactly 1000 or 20 in M566 as you'd need to enter 16.66666 recurring or 0.333 recurring.
 * not sure about the heated bed mapping at this time.

After the configurator you will probably want to [tune your heaters](https://duet3d.dozuki.com/Wiki/Tuning_the_heater_temperature_control)