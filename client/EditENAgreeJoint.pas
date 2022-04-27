
unit EditENAgreeJoint;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAgreeJointController ;

type
  TfrmENAgreeJointEdit = class(TDialogForm)
  
    lblCode : TLabel;
	  edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblAgreeNum : TLabel;
    edtAgreeNum: TEdit;
    lblAgreeDate : TLabel;
    edtAgreeDate: TDateTimePicker;
    lblBalanceLim : TLabel;
    memBalanceLim: TMemo;


  HTTPRIOENAgreeJoint: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbBalanceLimClear: TSpeedButton;
    lblENLine10: TLabel;
    edtENLine10: TEdit;
    edtENLineCable: TEdit;
    lblENLineCable: TLabel;
    HTTPRIOENLine10: THTTPRIO;
    HTTPRIOENLineCable: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbBalanceLimClearClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENAgreeJointEdit: TfrmENAgreeJointEdit;
  ENAgreeJointObj: ENAgreeJoint;

implementation

uses ENLine10Controller, ENLineCableController;

{uses  
    EnergyproController, EnergyproController2, ENAgreeJointController  ;
}
{$R *.dfm}

procedure TfrmENAgreeJointEdit.FormShow(Sender: TObject);
var TempENLine10: ENLine10ControllerSoapPort;
  ENLine10SuppliesObj: ENLine10;
  TempENLineCable: ENLineCableControllerSoapPort;
  ENLineCableSuppliesObj: ENLineCable;
begin
  DisableControls([edtENLine10, edtENLineCable]);
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtName, edtAgreeNum, memBalanceLim]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENAgreeJointObj.code);
      edtName.Text := ENAgreeJointObj.name;
      edtAgreeNum.Text := ENAgreeJointObj.agreeNum;
        if ENAgreeJointObj.agreeDate <> nil then
          begin
            edtAgreeDate.DateTime := EncodeDate(ENAgreeJointObj.agreeDate.Year,
              ENAgreeJointObj.agreeDate.Month, ENAgreeJointObj.agreeDate.Day);
            edtAgreeDate.checked := true;
          end
        else
          begin
            edtAgreeDate.DateTime:=SysUtils.Date;
            edtAgreeDate.checked := false;
          end;
      if ENAgreeJointObj.line10Ref <> nil then
        if ENAgreeJointObj.line10Ref.code <> Low(Integer) then
          begin
            TempENLine10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;
            ENLine10SuppliesObj :=
              TempENLine10.getObject(ENAgreeJointObj.line10Ref.code);
            edtENLine10.Text := ENLine10SuppliesObj.name;
          end;
      if ENAgreeJointObj.lineCableRef <> nil then
        if ENAgreeJointObj.lineCableRef.code <> Low(Integer) then
          begin
            TempENLineCable := HTTPRIOENLineCable as ENLineCableControllerSoapPort;
            ENLineCableSuppliesObj :=
              TempENLineCable.getObject(ENAgreeJointObj.lineCableRef.code);
            edtENLineCable.Text := ENLineCableSuppliesObj.name;
          end;
      //MakeMultiline(memBalanceLim.Lines, ENAgreeJointObj.balanceLim);
      memBalanceLim.Text := ENAgreeJointObj.balanceLim;
    end;
end;



procedure TfrmENAgreeJointEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAgreeJoint: ENAgreeJointControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtAgreeNum
      ,memBalanceLim
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENAgreeJoint := HTTPRIOENAgreeJoint as ENAgreeJointControllerSoapPort;


     ENAgreeJointObj.name := edtName.Text; 

     ENAgreeJointObj.agreeNum := edtAgreeNum.Text; 

     if edtagreeDate.checked then
     begin 
       if ENAgreeJointObj.agreeDate = nil then
          ENAgreeJointObj.agreeDate := TXSDate.Create;
       ENAgreeJointObj.agreeDate.XSToNative(GetXSDate(edtagreeDate.DateTime));
     end
     else
       ENAgreeJointObj.agreeDate := nil;

     ENAgreeJointObj.balanceLim := memBalanceLim.Text;

    if DialogState = dsInsert then
    begin
      ENAgreeJointObj.code:=low(Integer);
      TempENAgreeJoint.add(ENAgreeJointObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENAgreeJoint.save(ENAgreeJointObj);
    end;
  end;
end;

procedure TfrmENAgreeJointEdit.spbBalanceLimClearClick(Sender: TObject);
begin
  memBalanceLim.Text := 'Не определён';
end;

end.