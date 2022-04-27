
unit EditENWiresTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWiresTypeController ;

type
  TfrmENWiresTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblIsCabel : TLabel;
    edtIsCabel: TEdit;



  HTTPRIOENWiresType: THTTPRIO;

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
  frmENWiresTypeFilterEdit: TfrmENWiresTypeFilterEdit;
  ENWiresTypeFilterObj: ENWiresTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWiresTypeController  ;
}
{$R *.dfm}



procedure TfrmENWiresTypeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtIsCabel
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENWiresTypeObj.name; 



    if ( ENWiresTypeObj.isCabel <> Low(Integer) ) then
       edtIsCabel.Text := IntToStr(ENWiresTypeObj.isCabel)
    else
       edtIsCabel.Text := '';


  end;

}

end;



procedure TfrmENWiresTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWiresType: ENWiresTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENWiresTypeFilterObj.name := edtName.Text; 



     if ( edtIsCabel.Text <> '' ) then
       ENWiresTypeFilterObj.isCabel := StrToInt(edtIsCabel.Text)
     else
       ENWiresTypeFilterObj.isCabel := Low(Integer) ;





  end;
end;




end.