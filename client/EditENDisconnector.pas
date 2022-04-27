//Редактирование Разъединителя
unit EditENDisconnector;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDisconnectorController;

type TfrmENDisconnectorEdit = class(TDialogForm)
  lblCode : TLabel;
  edtCode : TEdit;
  lblRatedVoltage : TLabel;
  edtRatedVoltage: TEdit;
  lblRatedCurrent : TLabel;
  edtRatedCurrent: TEdit;
  lblENDisconnectorTypeName: TLabel;
  edtENDisconnectorTypeName: TEdit;
  spbENDisconnectorType: TSpeedButton;
  lblENElementName: TLabel;
  edtENElementName: TEdit;
  spbENElement: TSpeedButton;
  lblENHighVoltageSellName: TLabel;
  edtENHighVoltageSellName: TEdit;
  spbENHighVoltageSell: TSpeedButton;

  HTTPRIOENDisconnector: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblENDisconnectorDriveTypeName: TLabel;
    edtENDisconnectorDriveTypeName: TEdit;
    spbENDisconnectorDriveType: TSpeedButton;
    lblMaterialsName: TLabel;
    HTTPRIOSpr_matherial: THTTPRIO;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    spbMatDrive: TSpeedButton;
    edtMatDrive: TEdit;
    lblMatDrive: TLabel;
    lblDispName: TLabel;
    edtDispName: TEdit;
    HTTPRIOENSubstation04: THTTPRIO;
    lblENSubstation04: TLabel;
    memENSubstation04: TMemo;
    lblENLine10: TLabel;
    memENLine10: TMemo;
    lblENPostRefNubmerGen: TLabel;
    edtENPostRefNubmerGen: TEdit;
    HTTPRIOENLine10: THTTPRIO;
    HTTPRIOENPost: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);

  procedure spbENDisconnectorTypeClick(Sender : TObject);
  procedure spbENElementClick(Sender : TObject);
  procedure spbENHighVoltageSellClick(Sender : TObject);
    procedure spbENDisconnectorDriveTypeClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure spbMatDriveClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
end;

var
  frmENDisconnectorEdit: TfrmENDisconnectorEdit;
  ENDisconnectorObj: ENDisconnector;

implementation

uses
  EditENSubstation04, ENSubstation04Controller, ShowENDisconnectorType,
  ENDisconnectorTypeController, ShowENElement, ENElementController,
  ShowENHighVoltageSell, ENHighVoltageSellController,
  ShowENDisconnectorDriveType, ENDisconnectorDriveTypeController,
  ShowTKMaterials, TKMaterialsController, ENLine10Controller, ENPostController
;

{uses
    EnergyproController, EnergyproController2, ENDisconnectorController  ;
}
{$R *.dfm}

procedure TfrmENDisconnectorEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  matDriveObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
  TempENS04: ENSubstation04ControllerSoapPort;
  fENS04: ENSubstation04Filter;
  lstENS04: ENSubstation04ShortList;
  TempENL10: ENLine10ControllerSoapPort;
  objENL10: ENLine10;
  TempENPost: ENPostControllerSoapPort;
  objENPost: ENPost;

begin
  DisableControls([edtMatDrive, edtMaterialsName, memENSubstation04,
    edtENHighVoltageSellName, memENLine10, edtENPostRefNubmerGen]);
  SetFloatStyle([edtRatedVoltage, edtRatedCurrent]);
  if DialogState = dsView then
    begin
      DisableControls([spbENDisconnectorDriveType, edtENHighVoltageSellName,
        spbENHighVoltageSell, spbTkMaterials, spbMatDrive {, edtENDisconnectorTypeName,
        spbENDisconnectorType, edtENElementName, spbENElement}]);
    end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    begin
      DenyBlankValues([edtRatedVoltage, edtRatedCurrent, edtMaterialsName]);
    end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENDisconnectorObj.code);
      edtDispName.Text := ENDisconnectorObj.name;
      if ( ENDisconnectorObj.ratedVoltage <> nil) then
         edtRatedVoltage.Text := ENDisconnectorObj.ratedVoltage.decimalString
      else
         edtRatedVoltage.Text := '';
      if ( ENDisconnectorObj.ratedCurrent <> nil) then
         edtRatedCurrent.Text := ENDisconnectorObj.ratedCurrent.decimalString
      else
         edtRatedCurrent.Text := '';

      (*edtENDisconnectorTypeName.Text := ENDisconnectorObj.disconnectorType.name;
      edtENDisconnectorDriveTypeName.Text :=
        ENDisconnectorObj.disconnectordriveType.name;*)

      if ENDisconnectorObj.highvoltageSell <> nil then
        if ENDisconnectorObj.highvoltageSell.code <> low(Integer) then
          begin
            edtENHighVoltageSellName.Text :=
              'Ячейка № ' + ENDisconnectorObj.highvoltageSell.numberGen;
            if ENDisconnectorObj.highvoltageSell.element <> nil then
              if ENDisconnectorObj.highvoltageSell.element.elementInRef <> nil
              then
                if ENDisconnectorObj.highvoltageSell.element.elementInRef.code
                  <> low(Integer)
                then
                  begin
                    fENS04 := ENSubstation04Filter.Create;
                    try
                      SetNullIntProps(fENS04);
                      SetNullXSProps(fENS04);
                      fENS04.conditionSQL := ' ENSUBSTATION04.ELEMENTCODE = '
                        + IntToStr(
                          ENDisconnectorObj.highvoltageSell.element.elementInRef.code);
                      try
                        TempENS04 := HTTPRIOENSubstation04
                          as ENSubstation04ControllerSoapPort;
                        lstENS04 := TempENS04.getScrollableFilteredList(
                          fENS04, 0, -1);
                        if lstENS04.totalCount > 0 then
                          memENSubstation04.Text := lstENS04.list[0].renRefName
                            + '. ' + lstENS04.list[0].name;
                      except
                      end;
                    finally
                      fENS04.Free;
                      fENS04 := nil;
                    end;
                  end;
        end; //if ENDisconnectorObj.highvoltageSell.code <> low(Integer) then

      if ENDisconnectorObj.line10Ref <> nil then
        if ENDisconnectorObj.line10Ref.code <> low(Integer) then
          try
            TempENL10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;
            objENL10 := TempENL10.getObject(ENDisconnectorObj.line10Ref.code);
            try
              if objENL10.element <> nil then
                if objENL10.element.renRef <> nil then
                  memENLine10.Text := objENL10.element.renRef.name;
              if memENLine10.Text <> '' then
                memENLine10.Text := memENLine10.Text + '. ';
              memENLine10.Text := memENLine10.Text + objENL10.name;
            finally
              objENL10.Free;
              objENL10 := nil;
            end;
          except
          end;

      if ENDisconnectorObj.postRef <> nil then
        if ENDisconnectorObj.postRef.code <> low(Integer) then
          try
            TempENPost := HTTPRIOENPost as ENPostControllerSoapPort;
            objENPost := TempENPost.getObject(ENDisconnectorObj.postRef.code);
            try
              edtENPostRefNubmerGen.Text := objENPost.postNumberGen;
            finally
              objENPost.Free;
              objENPost := nil;
            end;
          except
          end;

      if ENDisconnectorObj.materialRef <> nil then
        if ENDisconnectorObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial :=
              HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENDisconnectorObj.materialRef.code;
            Spr_matherialList := TempSpr_matherial.getScrollableFilteredList(
              Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;

      if ENDisconnectorObj.matDriveRef <> nil then
        if ENDisconnectorObj.matDriveRef.code <> Low(Integer) then
          begin
            if TempSpr_matherial = nil then
              TempSpr_matherial :=
                HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            matDriveObj :=
              TempSpr_matherial.getObject(ENDisconnectorObj.matDriveRef.code);
            edtMatDrive.Text := matDriveObj.name;
          end;

      //edtENElementName.Text := ENDisconnectorObj.element.name;
    end;
end;

procedure TfrmENDisconnectorEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDisconnector: ENDisconnectorControllerSoapPort;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtRatedVoltage, edtRatedCurrent]) then
      begin
        Application.MessageBox(
          PChar('Пустые поля недопустимы!'),
          PChar('Внимание!'), MB_ICONWARNING + MB_OK);
        Action := caNone;
      end
    else
      begin
        TempENDisconnector :=
          HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
        ENDisconnectorObj.name := edtDispName.Text;
        if (ENDisconnectorObj.ratedVoltage = nil ) then
          ENDisconnectorObj.ratedVoltage := TXSDecimal.Create;
        if edtRatedVoltage.Text <> '' then
          ENDisconnectorObj.ratedVoltage.decimalString := edtRatedVoltage.Text
        else
          ENDisconnectorObj.ratedVoltage := nil;

        if (ENDisconnectorObj.ratedCurrent = nil ) then
          ENDisconnectorObj.ratedCurrent := TXSDecimal.Create;
        if edtRatedCurrent.Text <> '' then
          ENDisconnectorObj.ratedCurrent.decimalString := edtRatedCurrent.Text
        else
          ENDisconnectorObj.ratedCurrent := nil;

        //Поле ТИП РАЗЪЕДИНИТЕЛЯ не актуально
        (*
        if ENDisconnectorObj.disconnectorType <> nil then
          begin
            if ENDisconnectorObj.disconnectorType.code = low(Integer) then
              begin
                Application.MessageBox(PChar('Оберіть тип роз''єднувача!'),
                  PChar('Увага !'), MB_ICONWARNING + MB_OK);
                if edtENDisconnectorTypeName.CanFocus then
                  edtENDisconnectorTypeName.SetFocus;
                Action := caNone;
                Abort;
              end;
          end
        else
          begin
            Application.MessageBox(PChar('Оберіть тип роз''єднувача!'),
              PChar('Увага !'), MB_ICONWARNING + MB_OK);
            if edtENDisconnectorTypeName.CanFocus then
              edtENDisconnectorTypeName.SetFocus;
            Action := caNone;
            Abort;
          end;*)

        if (spbENHighVoltageSell.Visible)
        and (spbENHighVoltageSell.Enabled) then
          if ENDisconnectorObj.highvoltageSell <> nil then
            begin
              if ENDisconnectorObj.highvoltageSell.code = low(Integer) then
                begin
                  Application.MessageBox(PChar('Оберіть високовольтну ланку!'),
                    PChar('Увага !'), MB_ICONWARNING + MB_OK);
                  if edtENHighVoltageSellName.CanFocus then
                    edtENHighVoltageSellName.SetFocus;
                  Action := caNone;
                  Abort;
                end;
            end
          else
            begin
              Application.MessageBox(PChar('Оберіть високовольтну ланку!'),
                PChar('Увага !'), MB_ICONWARNING + MB_OK);
              if edtENHighVoltageSellName.CanFocus then
                edtENHighVoltageSellName.SetFocus;
              Action := caNone;
              Abort;
            end;

        if ENDisconnectorObj.materialRef <> nil then
          begin
            if ENDisconnectorObj.materialRef.code = low(Integer) then
              begin
                Application.MessageBox(PChar('Оберіть роз''єднувач!'),
                  PChar('Увага!'), MB_ICONWARNING + MB_OK);
                if edtMaterialsName.CanFocus then
                  edtMaterialsName.SetFocus;
                Action := caNone;
                Abort;
              end;
          end
        else
          begin
            Application.MessageBox(PChar('Оберіть роз''єднувач!'),
              PChar('Увага!'), MB_ICONWARNING + MB_OK);
            if edtMaterialsName.CanFocus then
              edtMaterialsName.SetFocus;
            Action := caNone;
            Abort;
          end;

        if ENDisconnectorObj.matDriveRef <> nil then
          begin
            if ENDisconnectorObj.matDriveRef.code = low(Integer) then
              begin
                Application.MessageBox(PChar('Оберіть привід роз''єднувача!'),
                  PChar('Увага!'), MB_ICONWARNING + MB_OK);
                if edtMatDrive.CanFocus then
                  edtMatDrive.SetFocus;
                Action := caNone;
                Abort;
              end;
          end
        else
          begin
            Application.MessageBox(PChar('Оберіть привід роз''єднувача!'),
              PChar('Увага!'), MB_ICONWARNING + MB_OK);
            if edtMatDrive.CanFocus then
              edtMatDrive.SetFocus;
            Action := caNone;
            Abort;
          end;

        if DialogState = dsInsert then
          begin
            ENDisconnectorObj.code := low(Integer);
            TempENDisconnector.add(ENDisconnectorObj);
          end
        else if DialogState = dsEdit then
          begin
            TempENDisconnector.save(ENDisconnectorObj);
          end;
      end;
end;


procedure TfrmENDisconnectorEdit.spbENDisconnectorTypeClick(
  Sender: TObject);
//var frmENDisconnectorTypeShow: TfrmENDisconnectorTypeShow;
begin
  (*frmENDisconnectorTypeShow :=
    TfrmENDisconnectorTypeShow.Create(Application,fmNormal);
  try
    with frmENDisconnectorTypeShow do
      if ShowModal = mrOk then
        begin
            try
              if ENDisconnectorObj.disconnectorType = nil then
                ENDisconnectorObj.disconnectorType :=
                  ENDisconnectorType.Create();
              ENDisconnectorObj.disconnectorType.code :=
                StrToInt(GetReturnValue(sgENDisconnectorType, 0));
              edtENDisconnectorTypeName.Text :=
                GetReturnValue(sgENDisconnectorType, 1);
            except
               on EConvertError do Exit;
            end;
        end;
  finally
    frmENDisconnectorTypeShow.Free;
  end;*)
end;

procedure TfrmENDisconnectorEdit.spbENElementClick(Sender: TObject);
//var frmENElementShow: TfrmENElementShow;
begin
   {frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDisconnectorObj.element = nil then ENDisconnectorObj.element := ENElement.Create();
               ENDisconnectorObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;}
end;

procedure TfrmENDisconnectorEdit.spbENHighVoltageSellClick(Sender: TObject);
var frmENHighVoltageSellShow: TfrmENHighVoltageSellShow;
  ENHighVoltageSellFilterObj: ENHighVoltageSellFilter;
begin
  ENHighVoltageSellFilterObj := ENHighVoltageSellFilter.Create;
  SetNullIntProps(ENHighVoltageSellFilterObj);
  SetNullXSProps(ENHighVoltageSellFilterObj);

  if ENSubstation04Obj <> nil then //Объект не пустой, если форма редактирования разъединителей
    if ENSubstation04Obj.element <> nil then //вызвана из формы редактирования постанций 6 - 10 / 0,4 кВ 
      if ENSubstation04Obj.element.code <> Low(Integer) then
        ENHighVoltageSellFilterObj.conditionSQL :=
          ' ENHIGHVOLTAGESELL.ELEMENTCODE in (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
              +  IntToStr(ENSubstation04Obj.element.code) + ')';

  frmENHighVoltageSellShow := TfrmENHighVoltageSellShow.Create(
    Application, fmNormal, ENHighVoltageSellFilterObj);
  try
    with frmENHighVoltageSellShow do
      if ShowModal = mrOk then
        begin
          try
            if ENDisconnectorObj.highvoltageSell = nil then
              ENDisconnectorObj.highvoltageSell := ENHighVoltageSell.Create();
            ENDisconnectorObj.highvoltageSell.code :=
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

procedure TfrmENDisconnectorEdit.spbENDisconnectorDriveTypeClick(Sender: TObject);
//var frmENDisconnectorDriveTypeShow: TfrmENDisconnectorDriveTypeShow;
begin
  (*frmENDisconnectorDriveTypeShow :=
    TfrmENDisconnectorDriveTypeShow.Create(Application,fmNormal);
  try
    with frmENDisconnectorDriveTypeShow do
      if ShowModal = mrOk then
        begin
          try
             if ENDisconnectorObj.disconnectordriveType = nil then
               ENDisconnectorObj.disconnectordriveType :=
                 ENDisconnectorDriveType.Create();
             ENDisconnectorObj.disconnectordriveType.code :=
               StrToInt(GetReturnValue(sgENDisconnectorDriveType,0));
             edtENDisconnectorDriveTypeName.Text :=
               GetReturnValue(sgENDisconnectorDriveType,1);
          except
             on EConvertError do Exit;
          end;
        end;
  finally
    frmENDisconnectorDriveTypeShow.Free;
  end;*)
end;

procedure TfrmENDisconnectorEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENDisconnectorObj.materialRef = nil then
            ENDisconnectorObj.materialRef := TKMaterialsRef.Create;
          ENDisconnectorObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code;
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

procedure TfrmENDisconnectorEdit.spbMatDriveClick(Sender: TObject);
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
              if ENDisconnectorObj.matDriveRef = nil then
                ENDisconnectorObj.matDriveRef := TKMaterialsRef.Create;
              ENDisconnectorObj.matDriveRef.code :=
                TKMaterialsShort(tvDep.Selected.Data).code;
              edtMatDrive.Text := TKMaterialsShort(tvDep.Selected.Data).name;
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