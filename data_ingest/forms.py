from django.forms import ModelForm, CharField
from django.contrib.auth.models import User
from data_ingest.models import FileUpload
from data_ingest.ingest import ContributedFile


class FileUploadForm(ModelForm):
    directory_name = CharField(max_length=50, required=False)

    def clean(self):
        cleaned_data = super(FileUploadForm, self).clean()
        file = cleaned_data.get('file')
        user = User.objects.get(username='recon')
        file_to_ingest = ContributedFile(file,
                                         user,)
        ingest_result = file_to_ingest.process()

    class Meta:
        model = FileUpload
        fields = ['file']
