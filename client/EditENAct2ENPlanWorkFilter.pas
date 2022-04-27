
unit EditENAct2ENPlanWorkFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAct2ENPlanWorkController ;

type
  TfrmENAct2ENPlanWorkFilterEdit = class(TDialogForm)


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
  frmENAct2ENPlanWorkFilterEdit: TfrmENAct2ENPlanWorkFilterEdit;
  ENAct2ENPlanWorkFilterObj: ENAct2ENPlanWorkFilter;

implementation

uses
  ShowENPlanWork
  ,ENPlanWorkController
;

{uses  
    EnergyproController, EnergyproController2, ENAct2ENPlanWorkController  ;
}
{$R *.dfm}



procedure TfrmENAct2ENPlanWorkFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
  end;

}

end;



procedure TfrmENAct2ENPlanWorkFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;

procedure TfrmENAct2ENPlanWorkFilterEdit.spbENPlanWorkPlanClick(Sender : TObject);
var 
   frmENPlanWorkShow: TfrmENPlanWorkShow;
begin
   frmENPlanWorkShow:=TfrmENPlanWorkShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkShow do
        if ShowModal = mrOk then
        begin
            try
               if ENAct2ENPlanWorkFilterObj.plan = nil then ENAct2ENPlanWorkFilterObj.plan := ENPlanWork.Create();
               ENAct2ENPlanWorkFilterObj.plan.code := StrToInt(GetReturnValue(sgENPlanWork,0));
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