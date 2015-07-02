from django.forms import ModelForm
from data_ingest.models import FileUpload
from data_ingest.ingest import ContributedFile


class FileUploadForm(ModelForm):
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super().__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = super().clean()
        file = cleaned_data.get('file')
        file_to_ingest = ContributedFile(file, self.request.user)
        return file_to_ingest.process()

    class Meta:
        model = FileUpload
        fields = ['file']
