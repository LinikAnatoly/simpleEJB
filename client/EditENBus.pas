//Редактирование Шины
unit EditENBus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls,
    Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
    GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENBusController ;

type
  TfrmENBusEdit = class(TDialogForm)

    lblCode : TLabel;
    edtCode : TEdit;
    lblInsulatornumberGen : TLabel;
    edtInsulatornumberGen: TEdit;
    lblLength : TLabel;
    edtLength: TEdit;
    lblLocationScheme : TLabel;
    edtLocationScheme: TEdit;
    lblENInsulatorTypeName: TLabel;
    edtENInsulatorTypeName: TEdit;
    spbENInsulatorType: TSpeedButton;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    lblENHighVoltageSellName: TLabel;
    edtENHighVoltageSellName: TEdit;
    spbENHighVoltageSell: TSpeedButton;
  

  HTTPRIOENBus: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbTkMaterials: TSpeedButton;
    edtMaterialsName: TEdit;
    lblMaterialsName: TLabel;
    HTTPRIOSpr_matherial: THTTPRIO;
    spbMatInsulator: TSpeedButton;
    lblMatInsulator: TLabel;
    edtMatInsulator: TEdit;
    lblDispName: TLabel;
    edtDispName: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENInsulatorTypeClick(Sender : TObject);
  procedure spbENElementClick(Sender : TObject);
  procedure spbENHighVoltageSellClick(Sender : TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure spbMatInsulatorClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENBusEdit: TfrmENBusEdit;
  ENBusObj: ENBus;

implementation

uses
  EditENSubstation04,
  ShowENInsulatorType, ENInsulatorTypeController,
  ShowENElement, ENElementController,
  ShowENHighVoltageSell, ENHighVoltageSellController,
  ShowTKMaterials, TKMaterialsController
;

{uses  
    EnergyproController, EnergyproController2, ENBusController  ;
}
{$R *.dfm}



procedure TfrmENBusEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  (*Spr_matherialObj,*) matInsulatorObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
begin
  DisableControls([edtENHighVoltageSellName, edtMaterialsName, edtMatInsulator
    {, edtENInsulatorTypeName}]);
  SetIntStyle([edtInsulatornumberGen]);
  SetFloatStyle([edtLength]);
  if DialogState = dsView then
  begin
    DisableControls([spbENInsulatorType, edtENHighVoltageSellName,
      spbENHighVoltageSell, spbTkMaterials, spbMatInsulator
      {, edtENElementName, spbENElement}]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtInsulatornumberGen
      ,edtLength
      ,edtLocationScheme
      ,edtMaterialsName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENBusObj.code);
      edtDispName.Text := ENBusObj.name;
      if ( ENBusObj.insulatornumberGen <> nil ) then
         edtInsulatornumberGen.Text := ENBusObj.insulatornumberGen.decimalString
      else
         edtInsulatornumberGen.Text := ''; 
      if ( ENBusObj.length <> nil ) then
         edtLength.Text := ENBusObj.length.decimalString
      else
         edtLength.Text := ''; 
      edtLocationScheme.Text := ENBusObj.locationScheme;

      edtENHighVoltageSellName.Text := 'Ячейка № ' +
        ENBusObj.highvoltageSell.numberGen;

      if ENBusObj.materialRef <> nil then
        if ENBusObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial :=
              HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENBusObj.materialRef.code;
            Spr_matherialList := TempSpr_matherial.getScrollableFilteredList(
              Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;

      if ENBusObj.matInsulatorRef <> nil then
        if ENBusObj.matInsulatorRef.code <> Low(Integer) then
          begin
            if TempSpr_matherial = nil then
              TempSpr_matherial :=
                HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            matInsulatorObj :=
              TempSpr_matherial.getObject(ENBusObj.matInsulatorRef.code);
            edtMatInsulator.Text := matInsulatorObj.name;
          end;
      //edtENInsulatorTypeName.Text := ENBusObj.insulatorType.name;
      //edtENElementName.Text := ENBusObj.element.name;
    end;
end;

procedure TfrmENBusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBus: ENBusControllerSoapPort;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtInsulatornumberGen, edtLength, edtLocationScheme])
    then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),
          PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Action:=caNone;
      end
    else
      begin
        TempENBus := HTTPRIOENBus as ENBusControllerSoapPort;


         ENBusObj.name := edtDispName.Text;
         if (ENBusObj.insulatornumberGen = nil ) then
           ENBusObj.insulatornumberGen := TXSDecimal.Create;
         if edtInsulatornumberGen.Text <> '' then
           ENBusObj.insulatornumberGen.decimalString := edtInsulatornumberGen.Text 
         else
           ENBusObj.insulatornumberGen := nil;

         if (ENBusObj.length = nil ) then
           ENBusObj.length := TXSDecimal.Create;
         if edtLength.Text <> '' then
           ENBusObj.length.decimalString := edtLength.Text 
         else
           ENBusObj.length := nil;

        ENBusObj.locationScheme := edtLocationScheme.Text;

        (*if ENBusObj.insulatorType <> nil then
          begin
            if ENBusObj.insulatorType.code = low(Integer) then
              begin
                Application.MessageBox(PChar('Оберіть тип ізоляції шини!'),
                  PChar('Увага '), MB_ICONWARNING + MB_OK);
                if edtENInsulatorTypeName.CanFocus then
                  edtENInsulatorTypeName.SetFocus;
                Action := caNone;
                Abort;
              end;
          end
        else
          begin
            Application.MessageBox(PChar('Оберіть тип ізоляції шини!'),
              PChar('Увага !'), MB_ICONWARNING + MB_OK);
            if edtENInsulatorTypeName.CanFocus then
              edtENInsulatorTypeName.SetFocus;
            Action := caNone;
            Abort;
          end;*)

        if ENBusObj.highvoltageSell <> nil then
          begin
            if ENBusObj.highvoltageSell.code = low(Integer) then
              begin
                Application.MessageBox(PChar('Оберіть високовольтну чарунку!'),
                  PChar('Увага '), MB_ICONWARNING + MB_OK);
                if edtENHighVoltageSellName.CanFocus then
                  edtENHighVoltageSellName.SetFocus;
                Action := caNone;
                Abort;
              end;
          end
        else
          begin
            Application.MessageBox(PChar('Оберіть високовольтну чарунку!'),
              PChar('Увага !'), MB_ICONWARNING + MB_OK);
            if edtENHighVoltageSellName.CanFocus then
              edtENHighVoltageSellName.SetFocus;
            Action := caNone;
            Abort;
          end;

        if ENBusObj.materialRef <> nil then
          begin
            if ENBusObj.materialRef.code = low(Integer) then
              begin
                Application.MessageBox(PChar('Оберіть електричну шину!'),
                  PChar('Увага!'), MB_ICONWARNING + MB_OK);
                if edtMaterialsName.CanFocus then
                  edtMaterialsName.SetFocus;
                Action := caNone;
                Abort;
              end;
          end
        else
          begin
            Application.MessageBox(PChar('Оберіть електричну шину!'),
              PChar('Увага!'), MB_ICONWARNING + MB_OK);
            if edtMaterialsName.CanFocus then
              edtMaterialsName.SetFocus;
            Action := caNone;
            Abort;
          end;

        if ENBusObj.matInsulatorRef <> nil then
          begin
            if ENBusObj.matInsulatorRef.code = low(Integer) then
              begin
                Application.MessageBox(PChar('Оберіть класифікатор ізолятору!'),
                  PChar('Увага!'), MB_ICONWARNING + MB_OK);
                if edtMatInsulator.CanFocus then
                  edtMatInsulator.SetFocus;
                Action := caNone;
                Abort;
              end;
          end
        else
          begin
            Application.MessageBox(PChar('Оберіть класифікатор ізолятору!'),
              PChar('Увага!'), MB_ICONWARNING + MB_OK);
            if edtMatInsulator.CanFocus then
              edtMatInsulator.SetFocus;
            Action := caNone;
            Abort;
          end;

        if DialogState = dsInsert then
          begin
            ENBusObj.code:=low(Integer);
            TempENBus.add(ENBusObj);
          end
        else if DialogState = dsEdit then
          begin
            TempENBus.save(ENBusObj);
          end;
      end;
end;


procedure TfrmENBusEdit.spbENInsulatorTypeClick(Sender : TObject);
//var frmENInsulatorTypeShow: TfrmENInsulatorTypeShow;
begin
   (*frmENInsulatorTypeShow:=TfrmENInsulatorTypeShow.Create(Application,fmNormal);
   try
      with frmENInsulatorTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBusObj.insulatorType = nil then ENBusObj.insulatorType :=
                 ENInsulatorType.Create();
               ENBusObj.insulatorType.code :=
                 StrToInt(GetReturnValue(sgENInsulatorType,0));
               edtENInsulatorTypeName.Text := GetReturnValue(sgENInsulatorType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENInsulatorTypeShow.Free;
   end;*)
end;



procedure TfrmENBusEdit.spbENElementClick(Sender : TObject);
//var frmENElementShow: TfrmENElementShow;
begin
   (*frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBusObj.element = nil then ENBusObj.element := ENElement.Create();
               ENBusObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;*)
end;

(*Недоступная для пользователю процедура перемещения шины по высоковольтным
ячейкам в пределах данной подстанции. Чтобы разрешить изменять ячейку, нужно
писваивать spbENHighVoltageSell.Enabled истинное значение*)
procedure TfrmENBusEdit.spbENHighVoltageSellClick(Sender : TObject);
var frmENHighVoltageSellShow: TfrmENHighVoltageSellShow;
  ENHighVoltageSellFilterObj: ENHighVoltageSellFilter;
begin
  ENHighVoltageSellFilterObj := ENHighVoltageSellFilter.Create;
  SetNullIntProps(ENHighVoltageSellFilterObj);
  SetNullXSProps(ENHighVoltageSellFilterObj);

  if ENSubstation04Obj <> nil then
    if ENSubstation04Obj.element <> nil then
      if ENSubstation04Obj.element.code <> Low(Integer) then
        ENHighVoltageSellFilterObj.conditionSQL :=
          ' ENHIGHVOLTAGESELL.ELEMENTCODE in (SELECT E.CODE '
          + 'FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
          +  IntToStr(ENSubstation04Obj.element.code) + ')';

  frmENHighVoltageSellShow := TfrmENHighVoltageSellShow.Create(
    Application, fmNormal, ENHighVoltageSellFilterObj);
  try
    with frmENHighVoltageSellShow do
      if ShowModal = mrOk then
        begin
          try
            if ENBusObj.highvoltageSell = nil then
              ENBusObj.highvoltageSell := ENHighVoltageSell.Create();
            ENBusObj.highvoltageSell.code :=
              StrToInt(GetReturnValue(sgENHighVoltageSell, 0));
            edtENHighVoltageSellName.Text :=
              GetReturnValue(sgENHighVoltageSell, 1);
          except
             on EConvertError do Exit;
          end;
        end;
  finally
    frmENHighVoltageSellShow.Free;
  end;
end;

procedure TfrmENBusEdit.spbTkMaterialsClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter;
begin
  if DialogState = dsView then Exit;
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);
  try
    with frmSpr_matherialShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);
      DenyGroupSelection := true;
      if ShowModal = mrOk then
      begin
        try
          if ENBusObj.materialRef = nil then
            ENBusObj.materialRef := TKMaterialsRef.Create;
          ENBusObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialsName.Text := TKMaterialsShort(tvDep.Selected.Data).name;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmENBusEdit.spbMatInsulatorClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
begin
  if DialogState = dsView then Exit;
    frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);
  try
    with frmSpr_matherialShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        DenyGroupSelection := true;
        if ShowModal = mrOk then
          begin
            try
              if ENBusObj.matInsulatorRef = nil then
                ENBusObj.matInsulatorRef := TKMaterialsRef.Create;
              ENBusObj.matInsulatorRef.code :=
                TKMaterialsShort(tvDep.Selected.Data).code;
              edtMatInsulator.Text := TKMaterialsShort(tvDep.Selected.Data).name;
            except
              on EConvertError do Exit;
            end;
          end;
      end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

end.