
unit EditENSealColorsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSealColorsController ;

type
  TfrmENSealColorsFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENSealColors: THTTPRIO;

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
  frmENSealColorsFilterEdit: TfrmENSealColorsFilterEdit;
  ENSealColorsFilterObj: ENSealColorsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSealColorsController  ;
}
{$R *.dfm}



procedure TfrmENSealColorsFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSealColorsObj.name; 


  end;

}

end;



procedure TfrmENSealColorsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENSealColors: ENSealColorsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSealColorsFilterObj.name := edtName.Text; 




  end;
end;




end.