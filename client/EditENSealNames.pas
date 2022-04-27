
unit EditENSealNames;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSealNamesController ;

type
  TfrmENSealNamesEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENSealNames: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbMaterialName: TSpeedButton;
    edtMaterialName: TEdit;
    Label1: TLabel;
    HTTPRIOTKMaterials: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbMaterialNameClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSealNamesEdit: TfrmENSealNamesEdit;
  ENSealNamesObj: ENSealNames;

implementation

uses ShowTKMaterials, TKMaterialsController, ENConsts;


{uses  
    EnergyproController, EnergyproController2, ENSealNamesController  ;
}
{$R *.dfm}



procedure TfrmENSealNamesEdit.FormShow(Sender: TObject);
var TempTKMaterials: TKMaterialsControllerSoapPort;
mtFilter : TKMaterialsFilter;
mtList : TKMaterialsShortList;
begin

   DisableControls([edtMaterialName, edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName, edtMaterialName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSealNamesObj.code);
    edtName.Text := ENSealNamesObj.name; 

   if ENSealNamesObj.materialRef <> nil then
      if ENSealNamesObj.materialRef.code <> Low(Integer) then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        mtFilter := TKMaterialsFilter.Create;
        SetNullIntProps(mtFilter);
        mtFilter.code := ENSealNamesObj.materialRef.code;
        mtList := TempTKMaterials.getScrollableFilteredList(mtFilter, 0, -1);
        if  ( mtList.totalCount > 0 ) then
        begin
           edtMaterialName.Text := mtList.list[0].name;
        end
      end;

  end;
end;



procedure TfrmENSealNamesEdit.spbMaterialNameClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
//mtFilter : TKMaterialsFilter;

begin
  inherited;
     frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);

  try
    with frmSpr_matherialShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);
      DenyGroupSelection := true;

      if ShowModal = mrOk then
      begin
        try
            if TKMaterialsShort(tvDep.Selected.Data).accountingTypeRefCode < TK_ACCOUNTINGTYPE_SEAL then
              begin
               Application.MessageBox(PChar('Обраний матеріал не э пломбою!!!'), PChar('Увага!'),MB_ICONQUESTION+MB_OK);
               exit;
              end;

            if ENSealNamesObj.materialRef = nil then ENSealNamesObj.materialRef := TKMaterialsRef.Create;
            ENSealNamesObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgSpr_matherial, 0));
            edtMaterialName.Text := TKMaterialsShort(tvDep.Selected.Data).name ; //GetReturnValue(sgSpr_matherial, 1);

        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmENSealNamesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSealNames: ENSealNamesControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName, edtMaterialName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSealNames := HTTPRIOENSealNames as ENSealNamesControllerSoapPort;


     ENSealNamesObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENSealNamesObj.code:=low(Integer);
      TempENSealNames.add(ENSealNamesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSealNames.save(ENSealNamesObj);
    end;
  end;
end;


end.