import os

SITE_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

MEDIA_ROOT = os.path.join(SITE_ROOT, 'media')

STATIC_ROOT = os.path.join(SITE_ROOT, 'static')
STATIC_URL = '/static/'

STATICFILES_STORAGE = 'pipeline.storage.PipelineCachedStorage'

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    'pipeline.finders.PipelineFinder',
)

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'g&bd3isw+03%r^-f#o+p(%w&&sxzcp%gl9#++)fy0d^y!0n20e'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []

INSTALLED_APPS = (
    'django_admin_bootstrapped',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'reconstruction_verification',
    'catch',
    'data_ingest',
    'django_extensions',
    'pipeline',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'reconstruction_verification.urls'

WSGI_APPLICATION = 'reconstruction_verification.wsgi.application'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'recon',
        'USER': 'recon',
        'PASSWORD': '',
        'HOST': '',
        'PORT': '5432',
    }
}


LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format': "[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s",
            'datefmt': "%d/%b/%Y %H:%M:%S"
        },
        'simple': {
            'format': '%(levelname)s %(message)s'
        },
    },
    'handlers': {
        'file': {
            'level': 'INFO',
            'class': 'logging.FileHandler',
            'filename': os.path.join(SITE_ROOT, 'log', 'recon.log'),
            'formatter': 'verbose'
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'propagate': True,
            'level': 'DEBUG',
        },
        'paes_auth': {
            'handlers': ['file'],
            'level': 'DEBUG',
        },
        'data_ingest': {
            'handlers': ['file'],
            'level': 'DEBUG',
        },
        'survey': {
            'handlers': ['file'],
            'level': 'DEBUG',
        },
        'aerial': {
            'handlers': ['file'],
            'level': 'DEBUG',
        },
        'mapping': {
            'handlers': ['file'],
            'level': 'DEBUG',
        },
    }
}

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.dummy.DummyCache',
    }
}


LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'UTC'
USE_I18N = True
USE_L10N = True
USE_TZ = True

PIPELINE_CSS = {
    'styles': {
        'source_filenames': (
            'css/*.css',
        ),
        'output_filename': 'css/styles.css',
        'extra_context': {
            'media': 'all'
        }
    }
}

PIPELINE_JS = {
    'scripts': {
        'source_filenames': (
            'js/recon.util.js',
            'js/recon.table.js',
            'js/recon.upload.js',
        ),
        'output_filename': 'js/scripts.js'
    },
    'vendor': {
        'source_filenames': (
            'js/vendor/jquery.min.js',
            'js/vendor/jquery.ui.widget.js',
            'js/vendor/jquery.*.js',
            'js/vendor/*.js'
        ),
        'output_filename': 'js/vendor.js'
    }
}
