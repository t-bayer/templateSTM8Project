/*************************************************************/
/**
 *  @file MyApplication.c
 *  @brief Default file for creating custom stm8 applications based on the default project
 *  @author Timo Bayer
 *
 *  @date 25.05.2016
 *  @version 1.0
 *************************************************************/

#include "stm8/stm8s_conf.h"
#include "MyModule.h"

/**
 * @brief The main function of the example application
 *
 * This function is automatically called on application startup
 * The function includes a simple example of using the template
 *
 * @return The status of the execution after the function is terminated
 */
int main(){
	uint32_t delayCounter;
	uint32_t maxDelay = getBlinkDelay();
	GPIOB->DDR |= GPIO_PIN_5;
	GPIOB->CR1 |= GPIO_PIN_5;

	while(1){
		GPIOB->ODR ^= GPIO_PIN_5;
		for(delayCounter=0; delayCounter<maxDelay;delayCounter++);
	}
}
