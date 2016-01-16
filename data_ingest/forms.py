from django import forms
from data_ingest.models import FileUpload
from data_ingest.ingest import ContributedFile
import logging


logger = logging.getLogger(__name__)


# used by the spreadsheet upload process
class FileUploadForm(forms.ModelForm):
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


class QueryForm(forms.Form):
    id = forms.IntegerField(widget=forms.HiddenInput)
    type = forms.CharField(widget=forms.HiddenInput)

    @classmethod
    def get_run_form(cls, query_id):
        return cls(initial={'id': query_id, 'type': 'run'})

    @classmethod
    def get_approve_form(cls, query_id):
        return cls(initial={'id': query_id, 'type': 'approve'})
