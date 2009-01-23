module I18n
	module Backend
		class Simple
			def available_locales
				init_translations unless initialized?
				translations.keys
			end
		end
	end
	def self.available_locales
		backend.available_locales
	end
end
