from django.forms import ModelForm
from data_ingest.models import FileUpload
from data_ingest.ingest import ContributedFile
import logging


logger = logging.getLogger(__name__)


class FileUploadForm(ModelForm):
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super().__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super().clean()
        file = cleaned_data.get('file')
        ContributedFile(
            file,
            self.request.user,
            int(self.request.POST.get('reference', 0)),
            self.request.POST.get('comment', None)
        )

    class Meta:
        model = FileUpload
        fields = ['file']
