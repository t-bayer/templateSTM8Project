/**
 * @file MyModule.h
 * @brief File containing example of a module for creating individual modules.
 *
 * @author Timo Bayer
 * @date 25 May 2018
 */
#include <stdint.h>

/**
 * @brief Returns a static value which can be used as delay condition
 *
 * @return Constant value which can be used as delay condition
 */
uint32_t getBlinkDelay(){
	return 0xFFFF;
}
