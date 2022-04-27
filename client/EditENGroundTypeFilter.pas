
unit EditENGroundTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENGroundTypeController ;

type
  TfrmENGroundTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENGroundType: THTTPRIO;

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
  frmENGroundTypeFilterEdit: TfrmENGroundTypeFilterEdit;
  ENGroundTypeFilterObj: ENGroundTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENGroundTypeController  ;
}
{$R *.dfm}



procedure TfrmENGroundTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENGroundTypeObj.name; 


  end;

}

end;



procedure TfrmENGroundTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENGroundType: ENGroundTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENGroundTypeFilterObj.name := edtName.Text; 




  end;
end;




end.