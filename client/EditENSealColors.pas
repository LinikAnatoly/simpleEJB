
unit EditENSealColors;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSealColorsController ;

type
  TfrmENSealColorsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENSealColors: THTTPRIO;

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
  frmENSealColorsEdit: TfrmENSealColorsEdit;
  ENSealColorsObj: ENSealColors;

implementation

uses ENConsts, TKMaterialsController, ShowTKMaterials;


{uses  
    EnergyproController, EnergyproController2, ENSealColorsController  ;
}
{$R *.dfm}



procedure TfrmENSealColorsEdit.FormShow(Sender: TObject);
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
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSealColorsObj.code);
    edtName.Text := ENSealColorsObj.name; 

       if ENSealColorsObj.materialRef <> nil then
      if ENSealColorsObj.materialRef.code <> Low(Integer) then
      begin
        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        mtFilter := TKMaterialsFilter.Create;
        SetNullIntProps(mtFilter);
        mtFilter.code := ENSealColorsObj.materialRef.code;
        mtList := TempTKMaterials.getScrollableFilteredList(mtFilter, 0, -1);
        if  ( mtList.totalCount > 0 ) then
        begin
           edtMaterialName.Text := mtList.list[0].name;
        end
      end;

  end;
end;



procedure TfrmENSealColorsEdit.spbMaterialNameClick(Sender: TObject);
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

            if ENSealColorsObj.materialRef = nil then ENSealColorsObj.materialRef := TKMaterialsRef.Create;
            ENSealColorsObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgSpr_matherial, 0));
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

procedure TfrmENSealColorsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSealColors: ENSealColorsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSealColors := HTTPRIOENSealColors as ENSealColorsControllerSoapPort;


     ENSealColorsObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENSealColorsObj.code:=low(Integer);
      TempENSealColors.add(ENSealColorsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSealColors.save(ENSealColorsObj);
    end;
  end;
end;


end.