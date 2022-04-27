
unit EditENPlanCorrectReasonFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanCorrectReasonController ;

type
  TfrmENPlanCorrectReasonFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPlanCorrectReason: THTTPRIO;

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
  frmENPlanCorrectReasonFilterEdit: TfrmENPlanCorrectReasonFilterEdit;
  ENPlanCorrectReasonFilterObj: ENPlanCorrectReasonFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanCorrectReasonController  ;
}
{$R *.dfm}



procedure TfrmENPlanCorrectReasonFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPlanCorrectReasonObj.name; 


  end;

}

end;



procedure TfrmENPlanCorrectReasonFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanCorrectReason: ENPlanCorrectReasonControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPlanCorrectReasonFilterObj.name := edtName.Text; 




  end;
end;




end.