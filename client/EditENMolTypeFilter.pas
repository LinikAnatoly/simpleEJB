
unit EditENMolTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMolTypeController ;

type
  TfrmENMolTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENMolType: THTTPRIO;

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
  frmENMolTypeFilterEdit: TfrmENMolTypeFilterEdit;
  ENMolTypeFilterObj: ENMolTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMolTypeController  ;
}
{$R *.dfm}



procedure TfrmENMolTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENMolTypeObj.name; 


  end;

}

end;



procedure TfrmENMolTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMolType: ENMolTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENMolTypeFilterObj.name := edtName.Text; 




  end;
end;




end.