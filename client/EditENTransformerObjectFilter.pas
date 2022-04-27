
unit EditENTransformerObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransformerObjectController ;

type
  TfrmENTransformerObjectFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblBuildNumber : TLabel;
    edtBuildNumber: TEdit;
    lblBuildYear : TLabel;
    edtBuildYear: TEdit;
    lblVoltageHi : TLabel;
    edtVoltageHi: TEdit;
    lblVoltageLow : TLabel;
    edtVoltageLow: TEdit;
    lblNomPower : TLabel;
    edtNomPower: TEdit;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    edtInvNumber: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblENTransformerTypeTransformerTypeName : TLabel;
  edtENTransformerTypeTransformerTypeName : TEdit;
  spbENTransformerTypeTransformerType : TSpeedButton;
  

  HTTPRIOENTransformerObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblInvNumber: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENTransformerTypeTransformerTypeClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransformerObjectFilterEdit: TfrmENTransformerObjectFilterEdit;
  ENTransformerObjectFilterObj: ENTransformerObjectFilter;

implementation

uses
  ShowENTransformerType
  ,ENTransformerTypeController
  ,ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENTransformerObjectController  ;
}
{$R *.dfm}



procedure TfrmENTransformerObjectFilterEdit.FormShow(Sender: TObject);
begin
  SetFloatStyle([edtVoltageHi, edtVoltageLow, edtNomPower]);
  SetIntStyle(edtBuildYear);


{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtVoltageHi
      ,edtVoltageLow
      ,edtNomPower
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENTransformerObjectObj.name; 



    edtBuildNumber.Text := ENTransformerObjectObj.buildNumber; 



    if ( ENTransformerObjectObj.buildYear <> Low(Integer) ) then
       edtBuildYear.Text := IntToStr(ENTransformerObjectObj.buildYear)
    else
       edtBuildYear.Text := '';



    if ( ENTransformerObjectObj.voltageHi <> nil ) then
       edtVoltageHi.Text := ENTransformerObjectObj.voltageHi.decimalString
    else
       edtVoltageHi.Text := ''; 



    if ( ENTransformerObjectObj.voltageLow <> nil ) then
       edtVoltageLow.Text := ENTransformerObjectObj.voltageLow.decimalString
    else
       edtVoltageLow.Text := ''; 



    if ( ENTransformerObjectObj.nomPower <> nil ) then
       edtNomPower.Text := ENTransformerObjectObj.nomPower.decimalString
    else
       edtNomPower.Text := ''; 



    edtBuhName.Text := ENTransformerObjectObj.buhName; 



    edtInvNumber.Text := ENTransformerObjectObj.invNumber; 



    edtCommentGen.Text := ENTransformerObjectObj.commentGen; 


  end;

}

end;



procedure TfrmENTransformerObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransformerObject: ENTransformerObjectControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
    ENTransformerObjectFilterObj.name := edtName.Text;
    ENTransformerObjectFilterObj.buildNumber := edtBuildNumber.Text;

    if edtBuildYear.Text <> '' then
      ENTransformerObjectFilterObj.buildYear := StrToInt(edtBuildYear.Text)
    else
      ENTransformerObjectFilterObj.buildYear := Low(Integer);

    if edtVoltageHi.Text <> '' then
    begin
      if (ENTransformerObjectFilterObj.voltageHi = nil) then
        ENTransformerObjectFilterObj.voltageHi := TXSDecimal.Create;
      ENTransformerObjectFilterObj.voltageHi.DecimalString := edtVoltageHi.Text;
    end
    else
      ENTransformerObjectFilterObj.voltageHi := nil;

    if edtVoltageLow.Text <> '' then
    begin
      if (ENTransformerObjectFilterObj.voltageLow = nil) then
        ENTransformerObjectFilterObj.voltageLow := TXSDecimal.Create;
      ENTransformerObjectFilterObj.voltageLow.DecimalString := edtVoltageLow.Text;
    end
    else
      ENTransformerObjectFilterObj.voltageLow := nil;

    if edtNomPower.Text <> '' then
    begin
      if (ENTransformerObjectFilterObj.nomPower = nil) then
        ENTransformerObjectFilterObj.nomPower := TXSDecimal.Create;
      ENTransformerObjectFilterObj.nomPower.DecimalString := edtNomPower.Text;
    end
    else
      ENTransformerObjectFilterObj.nomPower := nil;

    ENTransformerObjectFilterObj.buhName := edtBuhName.Text;
    ENTransformerObjectFilterObj.invNumber := edtInvNumber.Text;
    ENTransformerObjectFilterObj.commentGen := edtCommentGen.Text;
  end;
end;

procedure TfrmENTransformerObjectFilterEdit.spbENTransformerTypeTransformerTypeClick(Sender : TObject);
var 
   frmENTransformerTypeShow: TfrmENTransformerTypeShow;
begin
   frmENTransformerTypeShow:=TfrmENTransformerTypeShow.Create(Application,fmNormal);
   try
      with frmENTransformerTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransformerObjectFilterObj.transformerType = nil then ENTransformerObjectFilterObj.transformerType := ENTransformerType.Create();
               ENTransformerObjectFilterObj.transformerType.code := StrToInt(GetReturnValue(sgENTransformerType,0));
               edtENTransformerTypeTransformerTypeName.Text:=GetReturnValue(sgENTransformerType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENTransformerTypeShow.Free;
   end;
end;


end.
