
unit EditFINDoc2MolDataFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINDoc2MolDataController ;

type
  TfrmFINDoc2MolDataFilterEdit = class(TDialogForm)

    lblFinDocCode : TLabel;
    edtFinDocCode: TEdit;

  lblFINMolDataMolDataName : TLabel;
  edtFINMolDataMolDataName : TEdit;
  spbFINMolDataMolData : TSpeedButton;
  

  HTTPRIOFINDoc2MolData: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbFINMolDataMolDataClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmFINDoc2MolDataFilterEdit: TfrmFINDoc2MolDataFilterEdit;
  FINDoc2MolDataFilterObj: FINDoc2MolDataFilter;

implementation

uses
  ShowFINMolData
  ,FINMolDataController
;

{uses  
    EnergyproController, EnergyproController2, FINDoc2MolDataController  ;
}
{$R *.dfm}



procedure TfrmFINDoc2MolDataFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtFinDocCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( FINDoc2MolDataObj.finDocCode <> Low(Integer) ) then
       edtFinDocCode.Text := IntToStr(FINDoc2MolDataObj.finDocCode)
    else
       edtFinDocCode.Text := '';


  end;

}

end;



procedure TfrmFINDoc2MolDataFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINDoc2MolData: FINDoc2MolDataControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtFinDocCode.Text <> '' ) then
       FINDoc2MolDataFilterObj.finDocCode := StrToInt(edtFinDocCode.Text)
     else
       FINDoc2MolDataFilterObj.finDocCode := Low(Integer) ;





  end;
end;

procedure TfrmFINDoc2MolDataFilterEdit.spbFINMolDataMolDataClick(Sender : TObject);
var 
   frmFINMolDataShow: TfrmFINMolDataShow;
begin
   frmFINMolDataShow:=TfrmFINMolDataShow.Create(Application,fmNormal);
   try
      with frmFINMolDataShow do
        if ShowModal = mrOk then
        begin
            try
               if FINDoc2MolDataFilterObj.molData = nil then FINDoc2MolDataFilterObj.molData := FINMolData.Create();
               FINDoc2MolDataFilterObj.molData.code := StrToInt(GetReturnValue(sgFINMolData,0));
               edtFINMolDataMolDataName.Text:=GetReturnValue(sgFINMolData,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINMolDataShow.Free;
   end;
end;





end.