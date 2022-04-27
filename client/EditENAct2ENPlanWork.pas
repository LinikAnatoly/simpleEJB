
unit EditENAct2ENPlanWork;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAct2ENPlanWorkController ;

type
  TfrmENAct2ENPlanWorkEdit = class(TDialogForm)


  lblENPlanWorkPlanName : TLabel;
  edtENPlanWorkPlanName : TEdit;
  spbENPlanWorkPlan : TSpeedButton;
  

  HTTPRIOENAct2ENPlanWork: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPlanWorkPlanClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENAct2ENPlanWorkEdit: TfrmENAct2ENPlanWorkEdit;
  ENAct2ENPlanWorkObj: ENAct2ENPlanWork;

implementation

uses
  ShowENPlanWork
  ,ENPlanWorkController
;

{uses  
    EnergyproController, EnergyproController2, ENAct2ENPlanWorkController  ;
}
{$R *.dfm}



procedure TfrmENAct2ENPlanWorkEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    //edtENPlanWorkPlanName.Text := ENAct2ENPlanWorkObj.plan.name;

  end;
end;



procedure TfrmENAct2ENPlanWorkEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
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
    TempENAct2ENPlanWork := HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENAct2ENPlanWorkObj.code:=low(Integer);
      TempENAct2ENPlanWork.add(ENAct2ENPlanWorkObj, 1);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENAct2ENPlanWork.save(ENAct2ENPlanWorkObj);
    end;
  end;
end;


procedure TfrmENAct2ENPlanWorkEdit.spbENPlanWorkPlanClick(Sender : TObject);
var 
   frmENPlanWorkShow: TfrmENPlanWorkShow;
begin
   frmENPlanWorkShow:=TfrmENPlanWorkShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkShow do
        if ShowModal = mrOk then
        begin
            try
               if ENAct2ENPlanWorkObj.plan = nil then ENAct2ENPlanWorkObj.plan := ENPlanWork.Create();
               ENAct2ENPlanWorkObj.plan.code := StrToInt(GetReturnValue(sgENPlanWork,0));
               edtENPlanWorkPlanName.Text:=GetReturnValue(sgENPlanWork,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPlanWorkShow.Free;
   end;
end;



end.