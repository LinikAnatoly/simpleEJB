
unit EditFINMolFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINMolController ;

type
  TfrmFINMolFilterEdit = class(TDialogForm)

    lblText : TLabel;
    edtText: TEdit;
    lblObj_id : TLabel;
    edtObj_id: TEdit;
    lblState : TLabel;
    edtState: TEdit;


  HTTPRIOFINMol: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblFINMOLNumber: TLabel;
    edtFINMOLNumber: TEdit;
    CheckBox1: TCheckBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmFINMolFilterEdit: TfrmFINMolFilterEdit;
  FINMolFilterObj: FINMolFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, FINMolController  ;
}
{$R *.dfm}



procedure TfrmFINMolFilterEdit.FormShow(Sender: TObject);

begin

  //SetNumStyle(edtFINMOLNumber);

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtText
      ,edtObj_id
      ,edtState
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtText.Text := FINMolObj.text; 



    if ( FINMolObj.obj_id <> Low(Integer) ) then
       edtObj_id.Text := IntToStr(FINMolObj.obj_id)
    else
       edtObj_id.Text := '';



    if ( FINMolObj.state <> Low(Integer) ) then
       edtState.Text := IntToStr(FINMolObj.state)
    else
       edtState.Text := '';


  end;

}

  

end;



procedure TfrmFINMolFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINMol: FINMolControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     FINMolFilterObj.text := edtText.Text;
     FINMolFilterObj.id := edtFINMOLNumber.Text;
     if (CheckBox1.Visible=true) then
     if CheckBox1.Checked = false then
     FINMolFilterObj.state:= 1;




{

     if ( edtObj_id.Text <> '' ) then
       FINMolFilterObj.obj_id := StrToInt(edtObj_id.Text)
     else
       FINMolFilterObj.obj_id := Low(Integer) ;




     if ( edtState.Text <> '' ) then
       FINMolFilterObj.state := StrToInt(edtState.Text)
     else
       FINMolFilterObj.state := Low(Integer) ;
}




  end;
end;




end.
