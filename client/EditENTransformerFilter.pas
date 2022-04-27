
unit EditENTransformerFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransformerController ;

type
  TfrmENTransformerFilterEdit = class(TDialogForm)

    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblNominalPower : TLabel;
    edtNominalPower: TEdit;

  lblENTransformerTypeName : TLabel;
  edtENTransformerTypeName: TEdit;
  spbENTransformerType: TSpeedButton;


  HTTPRIOENTransformer: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENTransformerTypeClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransformerFilterEdit: TfrmENTransformerFilterEdit;
  ENTransformerFilterObj: ENTransformerFilter;

implementation

uses
  ShowENTransformerType
  ,ENTransformerTypeController
  ,ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENTransformerController  ;
}
{$R *.dfm}



procedure TfrmENTransformerFilterEdit.FormShow(Sender: TObject);
begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtENTransformerTypeName]);
    SetFloatStyle([edtNominalPower]);
   end;
end;

procedure TfrmENTransformerFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransformer: ENTransformerControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
     ENTransformerFilterObj.invNumber := edtInvNumber.Text;
     if edtNominalPower.Text <> '' then
       begin
         if (ENTransformerFilterObj.nominalPower = nil) then
           ENTransformerFilterObj.nominalPower := TXSDecimal.Create;
         ENTransformerFilterObj.nominalPower.decimalString :=
           edtNominalPower.Text;
       end;
  end;
end;

procedure TfrmENTransformerFilterEdit.spbENTransformerTypeClick(Sender : TObject);
var
  frmENTransformerTypeShow: TfrmENTransformerTypeShow;
begin
  frmENTransformerTypeShow:=TfrmENTransformerTypeShow.Create(Application,fmNormal);
  try
    with frmENTransformerTypeShow do
      if ShowModal = mrOk then
        begin
          try
            if ENTransformerFilterObj.transformerType = nil then
              ENTransformerFilterObj.transformerType :=
                ENTransformerType.Create();
            ENTransformerFilterObj.transformerType.code :=
              StrToInt(GetReturnValue(sgENTransformerType,0));
            edtENTransformerTypeName.Text :=
              GetReturnValue(sgENTransformerType,1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENTransformerTypeShow.Free;
  end;
end;


end.
