.PHONY: compose-minecraft
compose-minecraft:
	docker compose up -f ./images/compose.minecraft.yml -d --build
