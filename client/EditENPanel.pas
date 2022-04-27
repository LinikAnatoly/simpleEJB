
unit EditENPanel;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls,
    Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
    GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENPanelController ;

type
  TfrmENPanelEdit = class(TDialogForm)
    lblCode : TLabel;
	  edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblENArresterTypeName: TLabel;
    edtENArresterTypeName: TEdit;
    spbENArresterType: TSpeedButton;
    HTTPRIOENPanel: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    lblENPanelTypeName: TLabel;
    edtENPanelTypeName: TEdit;
    spbENPanelType: TSpeedButton;
    lblENElementName: TLabel;
    spbENMarkBus: TSpeedButton;
    edtENMarkBusName: TEdit;
    lblENMarkBusName: TLabel;
    lblFinMolCode: TLabel;
    spbTkMaterials: TSpeedButton;
    edtMaterialsName: TEdit;
    HTTPRIOSpr_matherial: THTTPRIO;
    lblMatBus: TLabel;
    spbMatBus: TSpeedButton;
    edtMatBus: TEdit;
    lblMatArrester: TLabel;
    spbMatArrester: TSpeedButton;
    edtMatArrester: TEdit;
    spbMatBusClear: TSpeedButton;
    spbMatArresterClear: TSpeedButton;
    lblTransformer: TLabel;
    spbTransformer: TSpeedButton;
    memTransformer: TMemo;
    HTTPRIOENTransformer: THTTPRIO;
    HTTPRIOENBranch: THTTPRIO;
    HTTPRIOENLowVoltBoard: THTTPRIO;
    spbMatTransformerClear: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENArresterTypeClick(Sender : TObject);
    procedure spbENPanelTypeClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENMarkBusClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
    procedure spbMatBusClick(Sender: TObject);
    procedure spbMatArresterClick(Sender: TObject);
    procedure spbMatBusClearClick(Sender: TObject);
    procedure spbMatArresterClearClick(Sender: TObject);
    procedure spbTransformerClick(Sender: TObject);
    procedure spbMatTransformerClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codeS04: Integer;
    pnlBrCnt: Integer; //Количество присоединённых через панель Отходящих Линий
end;

var
  frmENPanelEdit: TfrmENPanelEdit;
  ENPanelObj: ENPanel;

implementation

uses ShowENArresterType, ENArresterTypeController, ShowENPanel, ShowENPanelType,
  ENPanelTypeController, ShowENMarkBus, ENMarkBusController, ShowTKMaterials,
  TKMaterialsController, ShowENTransformer, ENTransformerController, Main,
  ENConsts, ENBranchController, ENLowVoltBoardController;

{$R *.dfm}

procedure TfrmENPanelEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  Spr_matherialObj, matBusObj, matArresterObj: TKMaterials;
  TempENTransformer: ENTransformerControllerSoapPort;
  ENTransformerObj: ENTransformer;
begin
  DisableControls([edtENPanelTypeName, edtMaterialsName, edtMatBus,
    edtMatArrester {, edtENMarkBusName, edtENArresterTypeName}]);
  if DialogState = dsView then
    DisableControls([spbENPanelType, spbENArresterType, spbTkMaterials,
      spbMatBus, spbMatArrester, memTransformer, spbTransformer
      {, spbENArresterType, spbENMarkBus}]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtName]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENPanelObj.code);
      edtName.Text := ENPanelObj.name;
      edtENPanelTypeName.Text := ENPanelObj.panelType.name;

      if ENPanelObj.materialRef <> nil then
        if ENPanelObj.materialRef.code <> Low(Integer) then
          begin
            if TempSpr_matherial = nil then
              TempSpr_matherial :=
                HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialObj :=
              TempSpr_matherial.getObject(ENPanelObj.materialRef.code);
            edtMaterialsName.Text := Spr_matherialObj.name;
          end;

      if ENPanelObj.matBusRef <> nil then
        if ENPanelObj.matBusRef.code <> Low(Integer) then
          begin
            if TempSpr_matherial = nil then
              TempSpr_matherial :=
                HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            matBusObj :=
              TempSpr_matherial.getObject(ENPanelObj.matBusRef.code);
            edtMatBus.Text := matBusObj.name;
          end;

      if ENPanelObj.matArresterRef <> nil then
        if ENPanelObj.matArresterRef.code <> Low(Integer) then
          begin
            if TempSpr_matherial = nil then
              TempSpr_matherial :=
                HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            matArresterObj :=
              TempSpr_matherial.getObject(ENPanelObj.matArresterRef.code);
            edtMatArrester.Text := matArresterObj.name;
          end;

      if ENPanelObj.transformer = nil then
        memTransformer.Clear
      else if ENPanelObj.transformer.code = low(Integer) then
        memTransformer.Clear
      else
        begin
          TempENTransformer :=
            HTTPRIOENTransformer as ENTransformerControllerSoapPort;
          ENTransformerObj :=
            TempENTransformer.getObject(ENPanelObj.transformer.code);
          try
            memTransformer.Text := ENTransformerObj.name + '. P = ' +
              ENTransformerObj.nominalPower.decimalString + ' кВА. ';
            if ENTransformerObj.transformerType <> nil then
              if ENTransformerObj.transformerType.code <> low(Integer) then
                memTransformer.Text := memTransformer.Text +
                  ENTransformerObj.transformerType.name + '.';
            if ENTransformerObj.invNumber <> '' then
              memTransformer.Text := memTransformer.Text + ' Інв. № ' +
                ENTransformerObj.invNumber;
          finally
            ENTransformerObj.Free;
            ENTransformerObj := nil;
          end;
        end;

      (*edtENArresterTypeName.Text := ENPanelObj.arresterType.name;
      edtENMarkBusName.Text := ENPanelObj.markBus.name;*)
    end;
end;

procedure TfrmENPanelEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPanel: ENPanelControllerSoapPort;
  TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
  ENLowVoltBoardObj: ENLowVoltBoard;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtName]) then
      begin
        Application.MessageBox(
          PChar('Пустые поля недопустимы !'),
          PChar('Внимание!'),MB_ICONWARNING+MB_OK);
        Action := caNone;
      end //if not NoBlankValues([edtName]) then
    else
      begin
        TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
        ENPanelObj.name := edtName.Text;

        if ENPanelObj.panelType <> nil then
          begin
            if ENPanelObj.panelType.code = low(Integer) then
              begin
                Application.MessageBox(PChar('Укажите назначение панели!'),
                  PChar('Внимание!'), MB_ICONWARNING + MB_OK);
                if edtENPanelTypeName.CanFocus then
                  edtENPanelTypeName.SetFocus;
                Action := caNone;
                Abort;
              end;
          end
        else
          begin
            Application.MessageBox(PChar('Укажите назначение панели!'),
              PChar('Внимание!'), MB_ICONWARNING + MB_OK);
            if edtENPanelTypeName.CanFocus then
              edtENPanelTypeName.SetFocus;
            Action := caNone;
            Abort;
          end;

        //Поля ТИП РАЗРЯДНИКА, МАРКА И СЕЧЕНИЕ МАТЕРИАЛА СБОРНЫХ ШИН ПАНЕЛИ
        //не актуальны для ПАНЕЛИ НИЗКОВОЛЬТНОГО ЩИТА
        (*
        if ENPanelObj.arresterType <> nil then
          begin
            if ENPanelObj.arresterType.code = low(Integer) then
              begin
                Application.MessageBox(PChar('Выберите тип разрядника!'),
                  PChar('Внимание!'), MB_ICONWARNING + MB_OK);
                if edtENarresterTypeName.CanFocus then
                  edtENarresterTypeName.SetFocus;
                Action := caNone;
                Abort;
              end;
          end
        else
          begin
            Application.MessageBox(PChar('Выберите тип разрядника!'),
              PChar('Внимание!'), MB_ICONWARNING + MB_OK);
            if edtENarresterTypeName.CanFocus then
              edtENarresterTypeName.SetFocus;
            Action := caNone;
            Abort;
          end;

        if ENPanelObj.markBus <> nil then
          begin
            if ENPanelObj.markBus.code = low(Integer) then
              begin
                Application.MessageBox(
                  PChar('Выберите марку и сечение материала сборных шин панели!'),
                  PChar('Внимание!'), MB_ICONWARNING + MB_OK);
                if edtENmarkBusName.CanFocus then
                  edtENmarkBusName.SetFocus;
                Action := caNone;
                Abort;
              end;
          end
        else
          begin
            Application.MessageBox(
              PChar('Выберите марку и сечение материала сборных шин панели!'),
              PChar('Внимание!'), MB_ICONWARNING + MB_OK);
            if edtENmarkBusName.CanFocus then
              edtENmarkBusName.SetFocus;
            Action := caNone;
            Abort;
          end;
        *)

        if ENPanelObj.materialRef <> nil then
          begin
            if ENPanelObj.materialRef.code = low(Integer) then
              begin
                Application.MessageBox(
                  PChar('Оберіть панель низьковольтного щита!'),
                  PChar('Увага!'), MB_ICONWARNING + MB_OK);
                if edtMaterialsName.CanFocus then
                  edtMaterialsName.SetFocus;
                Action := caNone;
                Abort;
              end;
          end
        else
          begin
            Application.MessageBox(
              PChar('Оберіть панель низьковольтного щита!'),
              PChar('Увага!'), MB_ICONWARNING + MB_OK);
            if edtMaterialsName.CanFocus then
              edtMaterialsName.SetFocus;
            Action := caNone;
            Abort;
          end;

        if ENPanelObj.matBusRef <> nil then
          begin
            if ENPanelObj.matBusRef.code = low(Integer) then
              if Application.MessageBox(
                PChar('Не обрано марку збірних шин панелі!'), PChar('Увага!'),
                MB_ICONWARNING + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK
              then
                begin
                  if edtMatBus.CanFocus then
                    edtMatBus.SetFocus;
                  Action := caNone;
                  Abort;
                end;
          end
        else if Application.MessageBox(
          PChar('Не обрано марку збірних шин панелі!'), PChar('Увага!'),
          MB_ICONWARNING + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK
        then
          begin
            if edtMatBus.CanFocus then
              edtMatBus.SetFocus;
            Action := caNone;
            Abort;
          end;

        if ENPanelObj.matArresterRef <> nil then
          begin
            if ENPanelObj.matArresterRef.code = low(Integer) then
              if Application.MessageBox(
                PChar('Не обрано розрядник панелі!'), PChar('Увага!'),
                MB_ICONWARNING + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK
              then
                begin
                  if edtMatArrester.CanFocus then
                    edtMatArrester.SetFocus;
                  Action := caNone;
                  Abort;
                end;
          end
        else if Application.MessageBox(
          PChar('Не обрано розрядник панелі!'), PChar('Увага!'),
          MB_ICONWARNING + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK 
        then
          begin
            if edtMatArrester.CanFocus then
              edtMatArrester.SetFocus;
            Action := caNone;
            Abort;
          end;

        //Связывание НВЩ данной Панели с привязываемым к Панели Трансформатором
        if (ENPanelObj.transformer <> nil)
        and (ENPanelObj.lowVoltBoard <> nil) then
          if (ENPanelObj.transformer.code <> low(Integer))
          and (ENPanelObj.lowVoltBoard.code <> low(Integer)) then
            begin
              TempENLowVoltBoard :=
                HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
              ENLowVoltBoardObj :=
                TempENLowVoltBoard.getObject(ENPanelObj.lowVoltBoard.code);
              try
                if ENLowVoltBoardObj.transformerRef = nil then
                  ENLowVoltBoardObj.transformerRef := ENTransformerRef.Create;
                ENLowVoltBoardObj.transformerRef.code :=
                  ENPanelObj.transformer.code;
                TempENLowVoltBoard.save(ENLowVoltBoardObj);
              finally
                ENLowVoltBoardObj.Free;
                ENLowVoltBoardObj := nil;
              end;
            end;

        if DialogState = dsInsert then
          begin
            ENPanelObj.code := low(Integer);
            TempENPanel.add(ENPanelObj);
          end
        else
          if DialogState = dsEdit then
            begin
              TempENPanel.save(ENPanelObj);
            end;
      end; //if not NoBlankValues([edtName]) then
end;

procedure TfrmENPanelEdit.spbENArresterTypeClick(Sender : TObject);
//var frmENArresterTypeShow: TfrmENArresterTypeShow;
begin
   (*frmENArresterTypeShow:=TfrmENArresterTypeShow.Create(Application,fmNormal);
   try
      with frmENArresterTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPanelObj.arresterType = nil then
                 ENPanelObj.arresterType := ENArresterType.Create();
               ENPanelObj.arresterType.code :=
                 StrToInt(GetReturnValue(sgENArresterType,0));
               edtENArresterTypeName.Text := GetReturnValue(sgENArresterType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENArresterTypeShow.Free;
   end;*)
end;

procedure TfrmENPanelEdit.spbENPanelTypeClick(Sender: TObject);
var frmENPanelTypeShow: TfrmENPanelTypeShow;
  pnlTypeCode: Integer; pnlTypeName: String;
begin //Справочник НАЗНАЧЕНИЙ ПАНЕЛЕЙ
  pnlTypeCode := 0;
  frmENPanelTypeShow := TfrmENPanelTypeShow.Create(Application, fmNormal);
  try
    with frmENPanelTypeShow do
      if ShowModal = mrOk then
        begin
          pnlTypeCode := StrToInt(GetReturnValue(sgENPanelType, 0));
          pnlTypeName := GetReturnValue(sgENPanelType, 1);
        end;
  finally
    frmENPanelTypeShow.Free;
  end;

  if pnlTypeCode > 0 then
    begin
      if (DialogState = dsEdit) and (pnlBrCnt > 0)  then
        case pnlTypeCode of                     //Назначение панели:
          ENPNL_NOTDEFINED                    ,	//Не определено
          ENPNL_INTRODUCTION_TRANSFORMER      ,	//Вводная трансформаторная панель
          ENPNL_SECTION                       ,	//Секционная панель
          ENPNL_INCLUSION_RESERVES_AUTOMATIC  :	//Панель автоматического включения резервов
            begin
              Application.MessageBox(
                PChar('Низковольтные линии могут быть присоединены только к '
                + #13#10 + 'Распределительной или Вводно-распределительной '
                + 'панели, или Щиту НН КТП'),
                PChar('Неправильное указание назначения панели:'),
                MB_ICONWARNING);
              Exit;
            end;
        end; //case pnlTypeCode of
      try
        if ENPanelObj.panelType = nil then
          ENPanelObj.panelType := ENPanelType.Create();
        ENPanelObj.panelType.code := pnlTypeCode;
        edtENPanelTypeName.Text := pnlTypeName;
      except
       on EConvertError do Exit;
      end;
    end; //if pnlTypeCode > 0 then
end;

procedure TfrmENPanelEdit.spbENElementClick(Sender: TObject);
//var frmENElementShow: TfrmENElementShow;
begin
  (*frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
  try
    with frmENElementShow do
      if ShowModal = mrOk then
        begin
          try
             if ENPanelObj.element = nil then
               ENPanelObj.element := ENElement.Create();
             ENPanelObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
             edtENElementName.Text:=GetReturnValue(sgENElement,1);
          except
             on EConvertError do Exit;
          end;
        end;
  finally
     frmENElementShow.Free;
  end;*)
end;

procedure TfrmENPanelEdit.spbENMarkBusClick(Sender: TObject);
//var frmENMarkBusShow: TfrmENMarkBusShow;
begin
   (*frmENMarkBusShow :=
     TfrmENMarkBusShow.Create(Application,fmNormal);
   try
      with frmENMarkBusShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPanelObj.markBus = nil then
                 ENPanelObj.markBus := ENMarkBus.Create();
               ENPanelObj.markBus.code :=
                 StrToInt(GetReturnValue(sgENMarkBus,0));
               edtENMarkBusName.Text := GetReturnValue(sgENMarkBus, 1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENMarkBusShow.Free;
   end;*)
end;

procedure TfrmENPanelEdit.spbTkMaterialsClick(Sender: TObject);
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
          if ENPanelObj.materialRef = nil then
            ENPanelObj.materialRef := TKMaterialsRef.Create;
          ENPanelObj.materialRef.code :=
            TKMaterialsShort(tvDep.Selected.Data).code;
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

procedure TfrmENPanelEdit.spbMatBusClick(Sender: TObject);
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
              if ENPanelObj.matBusRef = nil then
                ENPanelObj.matBusRef := TKMaterialsRef.Create;
              ENPanelObj.matBusRef.code :=
                TKMaterialsShort(tvDep.Selected.Data).code;
              edtMatBus.Text := TKMaterialsShort(tvDep.Selected.Data).name;
            except
              on EConvertError do Exit;
            end;
          end;
      end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmENPanelEdit.spbMatArresterClick(Sender: TObject);
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
              if ENPanelObj.matArresterRef = nil then
                ENPanelObj.matArresterRef := TKMaterialsRef.Create;
              ENPanelObj.matArresterRef.code :=
                TKMaterialsShort(tvDep.Selected.Data).code;
              edtMatArrester.Text := TKMaterialsShort(tvDep.Selected.Data).name;
            except
              on EConvertError do Exit;
            end;
          end;
      end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmENPanelEdit.spbMatBusClearClick(Sender: TObject);
begin
  edtMatBus.Text := 'Відсутня';
  if ENPanelObj.matBusRef <> nil then
    ENPanelObj.matBusRef.code := low(Integer);
end;

procedure TfrmENPanelEdit.spbMatArresterClearClick(Sender: TObject);
begin
  edtMatArrester.Text := 'Відсутній';
  if ENPanelObj.matArresterRef <> nil then
    ENPanelObj.matArresterRef.code := low(Integer);
end;

procedure TfrmENPanelEdit.spbTransformerClick(Sender: TObject);
var ENTransformerFilterObj: ENTransformerFilter;
  TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
  ENLowVoltBoardList: ENLowVoltBoardShortList;
  lvbFilterObj: ENLowVoltBoardFilter;
begin
  ENTransformerFilterObj := ENTransformerFilter.Create;
  SetNullIntProps(ENTransformerFilterObj);
  SetNullXSProps(ENTransformerFilterObj);
  ENTransformerFilterObj.conditionSQL :=
    'SUBSTATION04REFCODE = ' + IntToStr(codeS04);
  frmENTransformerShow := TfrmENTransformerShow.Create(
    Application, fmFiltered, ENTransformerFilterObj);
  try
    with frmENTransformerShow do
      begin
        DisableActions([actInsert, actEdit, actDelete, actFilter, actNoFilter]);
        ShowModal;
        if ModalResult = mrOk then
          begin
            //Связь с Трансформатором
            if ENPanelObj.transformer = nil then
              ENPanelObj.transformer := ENTransformerRef.Create;
            ENPanelObj.transformer.code := ShowENTransformer.transformerCode;

            //Связь с НВЩ
            TempENLowVoltBoard :=
              HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
            lvbFilterObj := ENLowVoltBoardFilter.Create;
            try
              SetNullIntProps(lvbFilterObj);
              SetNullXSProps(lvbFilterObj);
              lvbFilterObj.conditionSQL :=
                'ENLOWVOLTBOARD.TRANSFORMERREFCODE = ' +
                IntToStr(ShowENTransformer.transformerCode);
              ENLowVoltBoardList :=
                TempENLowVoltBoard.getScrollableFilteredList(
                  lvbFilterObj, 0, -1);
              try
                if High(ENLowVoltBoardList.list) > -1 then
                  begin
                    if ENPanelObj.lowVoltBoard = nil then
                      ENPanelObj.lowVoltBoard := ENLowVoltBoardRef.Create;
                    ENPanelObj.lowVoltBoard.code :=
                      ENLowVoltBoardList.list[0].code;
                  end;
              finally
                ENLowVoltBoardList.Free;
                ENLowVoltBoardList := nil;
              end;
            finally
              lvbFilterObj.Free;
              lvbFilterObj := nil;
            end;

            //Заполнение поля ТРАНСФОРМАТОР формы редактирования ПАНЕЛИ
            memTransformer.Text :=
              sgENTransformer.Cells[1, sgENTransformer.Row] + '. P = ' +
              sgENTransformer.Cells[2, sgENTransformer.Row] + ' кВА. ' +
              sgENTransformer.Cells[3, sgENTransformer.Row] + '.';
            if sgENTransformer.Cells[4, sgENTransformer.Row] <> '' then
              memTransformer.Text := memTransformer.Text + ' Інв. № ' +
                sgENTransformer.Cells[4, sgENTransformer.Row];
          end;
      end;
  finally
    frmENTransformerShow.Free;
  end;
end;

procedure TfrmENPanelEdit.spbMatTransformerClearClick(Sender: TObject);
begin
  memTransformer.Text := '';
  if ENPanelObj.lowVoltBoard <> nil then
    ENPanelObj.lowVoltBoard.code := low(Integer);
  if ENPanelObj.transformer <> nil then
    ENPanelObj.transformer.code := low(Integer);
end;

end.