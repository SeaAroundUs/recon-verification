from django import forms
from data_ingest.models import FileUpload, User, RawCatch
from data_ingest.ingest import ContributedFile, normalize
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


class AuthorizeForm(forms.Form):
    id = forms.IntegerField(widget=forms.HiddenInput)
    type = forms.CharField(widget=forms.HiddenInput, initial='authorize')
    user = forms.ModelChoiceField(queryset=User.objects.all(),
                                  widget=forms.Select(attrs={'class': 'form-control'}))


# used by the source normalization process
class NormalizeSourceForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super().__init__(*args, **kwargs)

    class Meta:
        model = RawCatch
        fields = ['id', 'source_file']


