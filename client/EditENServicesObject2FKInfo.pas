
unit EditENServicesObject2FKInfo;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesObject2FKInfoController ;

type
  TfrmENServicesObject2FKInfoEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENServicesObject2FKInfo: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    chkIsIncomeAct: TCheckBox;
    edtName: TEdit;
    lblName: TLabel;
    btnEnServicesObjectKindFK: TSpeedButton;
    HTTPRIOENServicesObjectKindFK: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEnServicesObjectKindFKClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENServicesObject2FKInfoEdit: TfrmENServicesObject2FKInfoEdit;
  ENServicesObject2FKInfoObj: ENServicesObject2FKInfo;

implementation

uses
  ENServicesObjectKindFKController, ShowENServicesObjectKindFK;


{uses  
    EnergyproController, EnergyproController2, ENServicesObject2FKInfoController  ;
}
{$R *.dfm}



procedure TfrmENServicesObject2FKInfoEdit.FormShow(Sender: TObject);
 var
   TempENServicesObjectKindFK: ENServicesObjectKindFKControllerSoapPort;
begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;
  DisableControls([edtCode]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENServicesObject2FKInfoObj.code);
    if ( ENServicesObject2FKInfoObj.isIncomeAct <> Low(Integer) ) then
       begin
         if ENServicesObject2FKInfoObj.isIncomeAct > 0  then
         chkIsIncomeAct.Checked:= True
         else
         chkIsIncomeAct.Checked:= False;

       end
    else
       chkIsIncomeAct.Checked:= False;


      TempENServicesObjectKindFK := HTTPRIOENServicesObjectKindFK as ENServicesObjectKindFKControllerSoapPort;

    if ENServicesObject2FKInfoObj.servicesObjectKindFKRef <> nil then
       if ENServicesObject2FKInfoObj.servicesObjectKindFKRef.code <> Low(Integer) then
        begin
           edtName.Text := TempENServicesObjectKindFK.getObject(ENServicesObject2FKInfoObj.servicesObjectKindFKRef.code).name;
        end;


  end;
end;



procedure TfrmENServicesObject2FKInfoEdit.btnEnServicesObjectKindFKClick(
  Sender: TObject);
var frmENServicesObjectKindFKShow: TfrmENServicesObjectKindFKShow;
begin
  if DialogState = dsView then Exit;

  frmENServicesObjectKindFKShow := TfrmENServicesObjectKindFKShow.Create(Application, fmNormal);

  try
    with frmENServicesObjectKindFKShow do
      if ShowModal = mrOk then
      begin
        try
          if ENServicesObject2FKInfoObj.servicesObjectKindFKRef  = nil then
          ENServicesObject2FKInfoObj.servicesObjectKindFKRef := ENServicesObjectKindFKRef.Create;
          ENServicesObject2FKInfoObj.servicesObjectKindFKRef.code := StrToInt(GetReturnValue(sgENServicesObjectKindFK, 0));
          edtName.Text := GetReturnValue(sgENServicesObjectKindFK, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENServicesObjectKindFKShow.Free;
  end;
end;

procedure TfrmENServicesObject2FKInfoEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesObject2FKInfo: ENServicesObject2FKInfoControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENServicesObject2FKInfo := HTTPRIOENServicesObject2FKInfo as ENServicesObject2FKInfoControllerSoapPort;


     if ( chkIsIncomeAct.Checked )then
       ENServicesObject2FKInfoObj.isIncomeAct := 1
     else
       ENServicesObject2FKInfoObj.isIncomeAct := 0;

    if DialogState = dsInsert then
    begin
      ENServicesObject2FKInfoObj.code:=low(Integer);
      TempENServicesObject2FKInfo.add(ENServicesObject2FKInfoObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENServicesObject2FKInfo.save(ENServicesObject2FKInfoObj);
    end;
  end;
end;


end.