
unit EditENHighVoltHardwareTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENHighVoltHardwareTypeController ;

type
    TfrmENHighVoltHardwareTypeFilterEdit = class(TDialogForm)
    HTTPRIOENHighVoltHardwareType: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblName: TLabel;
    lblIsObsolete: TLabel;
    cbIsObsolete: TComboBox;
    edtName: TEdit;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENHighVoltHardwareTypeFilterEdit: TfrmENHighVoltHardwareTypeFilterEdit;
  ENHighVoltHardwareTypeFilterObj: ENHighVoltHardwareTypeFilter;

implementation



{$R *.dfm}



procedure TfrmENHighVoltHardwareTypeFilterEdit.FormShow(Sender: TObject);
begin
{ пока ниче не делать ...
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtIsObsolete
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENHighVoltHardwareTypeObj.name;

    if ( ENHighVoltHardwareTypeObj.isObsolete <> Low(Integer) ) then
       edtIsObsolete.Text := IntToStr(ENHighVoltHardwareTypeObj.isObsolete)
    else
       edtIsObsolete.Text := '';
  end;
}

end;


procedure TfrmENHighVoltHardwareTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENHighVoltHardwareType: ENHighVoltHardwareTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
    ENHighVoltHardwareTypeFilterObj.name := edtName.Text;

    if cbIsObsolete.ItemIndex <> -1 then
      ENHighVoltHardwareTypeFilterObj.isObsolete := cbIsObsolete.ItemIndex;

  end;
end;




end.