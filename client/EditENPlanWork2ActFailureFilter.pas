
unit EditENPlanWork2ActFailureFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWork2ActFailureController ;

type
  TfrmENPlanWork2ActFailureFilterEdit = class(TDialogForm)



  HTTPRIOENPlanWork2ActFailure: THTTPRIO;

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
  frmENPlanWork2ActFailureFilterEdit: TfrmENPlanWork2ActFailureFilterEdit;
  ENPlanWork2ActFailureFilterObj: ENPlanWork2ActFailureFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWork2ActFailureController  ;
}
{$R *.dfm}



procedure TfrmENPlanWork2ActFailureFilterEdit.FormShow(Sender: TObject);

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



procedure TfrmENPlanWork2ActFailureFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWork2ActFailure: ENPlanWork2ActFailureControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;




end.