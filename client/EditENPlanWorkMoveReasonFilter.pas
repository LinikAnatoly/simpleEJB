
unit EditENPlanWorkMoveReasonFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkMoveReasonController ;

type
  TfrmENPlanWorkMoveReasonFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPlanWorkMoveReason: THTTPRIO;

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
  frmENPlanWorkMoveReasonFilterEdit: TfrmENPlanWorkMoveReasonFilterEdit;
  ENPlanWorkMoveReasonFilterObj: ENPlanWorkMoveReasonFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkMoveReasonController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkMoveReasonFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENPlanWorkMoveReasonObj.name; 


  end;

}

end;



procedure TfrmENPlanWorkMoveReasonFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkMoveReason: ENPlanWorkMoveReasonControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPlanWorkMoveReasonFilterObj.name := edtName.Text; 




  end;
end;




end.