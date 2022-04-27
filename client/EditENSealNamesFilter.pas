
unit EditENSealNamesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSealNamesController ;

type
  TfrmENSealNamesFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENSealNames: THTTPRIO;

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
  frmENSealNamesFilterEdit: TfrmENSealNamesFilterEdit;
  ENSealNamesFilterObj: ENSealNamesFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSealNamesController  ;
}
{$R *.dfm}



procedure TfrmENSealNamesFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSealNamesObj.name; 


  end;

}

end;



procedure TfrmENSealNamesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENSealNames: ENSealNamesControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSealNamesFilterObj.name := edtName.Text; 




  end;
end;




end.