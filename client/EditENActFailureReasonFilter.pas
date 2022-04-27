
unit EditENActFailureReasonFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActFailureReasonController ;

type
  TfrmENActFailureReasonFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENActFailureReason: THTTPRIO;

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
  frmENActFailureReasonFilterEdit: TfrmENActFailureReasonFilterEdit;
  ENActFailureReasonFilterObj: ENActFailureReasonFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActFailureReasonController  ;
}
{$R *.dfm}



procedure TfrmENActFailureReasonFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENActFailureReasonObj.name; 


  end;

}

end;



procedure TfrmENActFailureReasonFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActFailureReason: ENActFailureReasonControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENActFailureReasonFilterObj.name := edtName.Text; 




  end;
end;




end.