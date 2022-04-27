
unit EditENSITFeatureHistory;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSITFeatureHistoryController ;

type
  TfrmENSITFeatureHistoryEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblNewvalue : TLabel;
    edtNewvalue: TEdit;
    lblOldvalue : TLabel;
    edtOldvalue: TEdit;
    lblDategen : TLabel;
    edtDategen: TDateTimePicker;


  HTTPRIOENSITFeatureHistory: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSITFeatureHistoryEdit: TfrmENSITFeatureHistoryEdit;
  ENSITFeatureHistoryObj: ENSITFeatureHistory;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSITFeatureHistoryController  ;
}
{$R *.dfm}



procedure TfrmENSITFeatureHistoryEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtNewvalue
      ,edtOldvalue
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENSITFeatureHistoryObj.name; 
    edtNewvalue.Text := ENSITFeatureHistoryObj.newvalue; 
    edtOldvalue.Text := ENSITFeatureHistoryObj.oldvalue; 
      if ENSITFeatureHistoryObj.dategen <> nil then
      begin
        edtDategen.DateTime:=EncodeDate(ENSITFeatureHistoryObj.dategen.Year,ENSITFeatureHistoryObj.dategen.Month,ENSITFeatureHistoryObj.dategen.Day);
        edtDategen.checked := true;
      end
      else
      begin
        edtDategen.DateTime:=SysUtils.Date;
        edtDategen.checked := false;
      end;


  end;
end;



procedure TfrmENSITFeatureHistoryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSITFeatureHistory: ENSITFeatureHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtNewvalue
      ,edtOldvalue
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSITFeatureHistory := HTTPRIOENSITFeatureHistory as ENSITFeatureHistoryControllerSoapPort;


     ENSITFeatureHistoryObj.name := edtName.Text; 

     ENSITFeatureHistoryObj.newvalue := edtNewvalue.Text; 

     ENSITFeatureHistoryObj.oldvalue := edtOldvalue.Text; 

     if edtdategen.checked then
     begin 
       if ENSITFeatureHistoryObj.dategen = nil then
          ENSITFeatureHistoryObj.dategen := TXSDate.Create;
       ENSITFeatureHistoryObj.dategen.XSToNative(GetXSDate(edtdategen.DateTime));
     end
     else
       ENSITFeatureHistoryObj.dategen := nil;

    if DialogState = dsInsert then
    begin
      ENSITFeatureHistoryObj.code:=low(Integer);
      TempENSITFeatureHistory.add(ENSITFeatureHistoryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSITFeatureHistory.save(ENSITFeatureHistoryObj);
    end;
  end;
end;


end.