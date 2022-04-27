
unit EditENBelongingFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBelongingController ;

type
  TfrmENBelongingFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENBelonging: THTTPRIO;

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
  frmENBelongingFilterEdit: TfrmENBelongingFilterEdit;
  ENBelongingFilterObj: ENBelongingFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBelongingController  ;
}
{$R *.dfm}



procedure TfrmENBelongingFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENBelongingObj.name; 


  end;

}

end;



procedure TfrmENBelongingFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBelonging: ENBelongingControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBelongingFilterObj.name := edtName.Text; 




  end;
end;




end.