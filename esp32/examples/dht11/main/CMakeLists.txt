set(COMPONENT_SRCS
	"app_main.c"
	"mqtt_demo_mutual_auth.c"
	"./../../../../../v44/esp-idf/components/esp32-DHT11/dht11.c"
	)

set(COMPONENT_ADD_INCLUDEDIRS
	"."
	"./../../../../../v44/esp-idf/components/esp32-DHT11/include/"
	"${CMAKE_CURRENT_LIST_DIR}"
	)

idf_component_register(SRCS "${COMPONENT_SRCS}"
					   INCLUDE_DIRS ${COMPONENT_ADD_INCLUDEDIRS}
					  )