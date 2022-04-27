//Редактирование Разрядника
unit EditENArrester;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
  	EnergyproController, EnergyproController2, ENArresterController ;

type
  TfrmENArresterEdit = class(TDialogForm)

    lblCode : TLabel;
	  edtCode : TEdit;
    lblDispName: TLabel;
    edtDispName: TEdit;
    lblENArresterTypeName: TLabel;
    edtENArresterTypeName: TEdit;
    spbENArresterType: TSpeedButton;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    lblENHighVoltageSell: TLabel;
    edtENHighVoltageSellName: TEdit;
    spbENHighVoltageSell: TSpeedButton;
  

  HTTPRIOENArrester: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblENArresterSiteName: TLabel;
    edtENArresterSiteName: TEdit;
    spbENArresterSite: TSpeedButton;
    lblENLowVoltBoardName: TLabel;
    edtENLowVoltBoardName: TEdit;
    spbENLowVoltBoard: TSpeedButton;
    lblMaterialsName: TLabel;
    HTTPRIOSpr_matherial: THTTPRIO;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    lblENSubstation04: TLabel;
    HTTPRIOENSubstation04: THTTPRIO;
    memENSubstation04: TMemo;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENArresterTypeClick(Sender : TObject);
    procedure spbENElementClick(Sender : TObject);
    procedure spbENHighVoltageSellClick(Sender : TObject);
    procedure spbENArresterSiteClick(Sender: TObject);
    procedure spbENLowVoltBoardClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENArresterEdit: TfrmENArresterEdit;
  ENArresterObj: ENArrester;

implementation

uses
  EditENSubstation04, ENSubstation04Controller,
  ShowENArresterType, ENArresterTypeController,
  ShowENElement, ENElementController,
  ShowENHighVoltageSell, ENHighVoltageSellController,
  ShowENArresterSite, ENArresterSiteController,
  ShowENLowVoltBoard, ENLowVoltBoardController,
  ShowTKMaterials, TKMaterialsController
;

{$R *.dfm}

procedure TfrmENArresterEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
  TempENS04: ENSubstation04ControllerSoapPort;
  fENS04: ENSubstation04Filter;
  lstENS04: ENSubstation04ShortList;
begin
  FormatSettings.DecimalSeparator := '.';
  DisableControls([edtENHighVoltageSellName, edtENArresterSiteName,
    memENSubstation04, edtENLowVoltBoardName, edtMaterialsName
    {, edtENArresterTypeName}]);
  if DialogState = dsView then
   begin
    DisableControls([edtENHighVoltageSellName, spbENHighVoltageSell,
      edtENArresterSiteName, spbENArresterSite, edtENLowVoltBoardName,
      spbENLowVoltBoard, spbTkMaterials {, spbENArresterType,
      edtENArresterTypeName, edtENElementName, spbENElement}]);
   end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
   begin
    DenyBlankValues([edtMaterialsName {, edtName}]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENArresterObj.code);
      edtDispName.Text := ENArresterObj.name;
      //edtENArresterTypeName.Text := ENArresterObj.arresterType.name;
      edtENArresterSiteName.Text := ENArresterObj.arresterSite.name;
      if ENArresterObj.highvoltageSell <> nil then
        if ENArresterObj.highvoltageSell.code <> low(Integer) then
          begin
            edtENHighVoltageSellName.Text :=
              'Ячейка № ' + ENArresterObj.highvoltageSell.numberGen;
            if ENArresterObj.highvoltageSell.element <> nil then
            if ENArresterObj.highvoltageSell.element.elementInRef <> nil
            then
              if ENArresterObj.highvoltageSell.element.elementInRef.code
                <> low(Integer)
              then
                begin
                  fENS04 := ENSubstation04Filter.Create;
                  try
                    SetNullIntProps(fENS04);
                    SetNullXSProps(fENS04);
                    fENS04.conditionSQL := ' ENSUBSTATION04.ELEMENTCODE = '
                      + IntToStr(
                        ENArresterObj.highvoltageSell.element.elementInRef.code);
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
          end;
      edtENLowVoltBoardName.Text := ENArresterObj.lowVoltBoard.name;
      if ENArresterObj.materialRef <> nil then
        if ENArresterObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENArresterObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;

      //edtENElementName.Text := ENArresterObj.element.name;
    end;
end;



procedure TfrmENArresterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENArrester: ENArresterControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtENArresterSiteName, edtMaterialsName {, edtName}])  then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),
        PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action := caNone;
    end
  else
  begin
    TempENArrester := HTTPRIOENArrester as ENArresterControllerSoapPort;


    //Поля ТИП РАЗРЯДНИКА, НАЗВАНИЕ РАЗРЯДНИКА не актуальны
    (*ENArresterObj.name := edtName.Text;

    if ENArresterObj.ArresterType <> nil then
      begin
        if ENArresterObj.ArresterType.code = low(Integer) then
          begin
            Application.MessageBox(PChar('Оберіть тип розрядника!'),
              PChar('Увага '), MB_ICONWARNING + MB_OK);
            if edtENArresterTypeName.CanFocus then
              edtENArresterTypeName.SetFocus;
            Action := caNone;
            Abort;
          end;
      end
    else
      begin
        Application.MessageBox(PChar('Оберіть тип розрядника!'),
          PChar('Увага !'), MB_ICONWARNING + MB_OK);
        if edtENArresterTypeName.CanFocus then
          edtENArresterTypeName.SetFocus;
        Action := caNone;
        Abort;
      end;*)

    if ENArresterObj.ArresterSite <> nil then
      begin
        if ENArresterObj.ArresterSite.code = low(Integer) then
          begin
            Application.MessageBox(PChar('Оберіть місце встановлення розрядника!'),
              PChar('Увага '), MB_ICONWARNING + MB_OK);
            if edtENArresterSiteName.CanFocus then
              edtENArresterSiteName.SetFocus;
            Action := caNone;
            Abort;
          end;
      end
    else
      begin
        Application.MessageBox(PChar('Оберіть місце встановлення розрядника!'),
          PChar('Увага !'), MB_ICONWARNING + MB_OK);
        if edtENArresterSiteName.CanFocus then
          edtENArresterSiteName.SetFocus;
        Action := caNone;
        Abort;
      end;

    if ENArresterObj.highvoltageSell <> nil then
      begin
        if ENArresterObj.highvoltageSell.code = low(Integer) then
          begin
            Application.MessageBox(PChar('Оберіть високовольтну ланку!'),
              PChar('Увага '), MB_ICONWARNING + MB_OK);
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
    ENArresterObj.name := edtDispName.Text;
    if DialogState = dsInsert then
    begin
      ENArresterObj.code:=low(Integer);
      TempENArrester.add(ENArresterObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENArrester.save(ENArresterObj);
    end;
  end;
end;


procedure TfrmENArresterEdit.spbENArresterTypeClick(Sender : TObject);
//var frmENArresterTypeShow: TfrmENArresterTypeShow;
begin
   (*frmENArresterTypeShow:=TfrmENArresterTypeShow.Create(Application,fmNormal);
   try
      with frmENArresterTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENArresterObj.arresterType = nil then ENArresterObj.arresterType := ENArresterType.Create();
               ENArresterObj.arresterType.code := StrToInt(GetReturnValue(sgENArresterType,0));
               edtENArresterTypeName.Text:=GetReturnValue(sgENArresterType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENArresterTypeShow.Free;
   end;*)
end;



procedure TfrmENArresterEdit.spbENElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENArresterObj.element = nil then ENArresterObj.element := ENElement.Create();
               ENArresterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;

procedure TfrmENArresterEdit.spbENHighVoltageSellClick(Sender : TObject);
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
          ' ENHIGHVOLTAGESELL.ELEMENTCODE in (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
              +  IntToStr(ENSubstation04Obj.element.code) + ')';

  frmENHighVoltageSellShow := TfrmENHighVoltageSellShow.Create(
    Application, fmNormal, ENHighVoltageSellFilterObj);
  try
    with frmENHighVoltageSellShow do
      if ShowModal = mrOk then
        begin
          try
            if ENArresterObj.highvoltageSell = nil then
              ENArresterObj.highvoltageSell := ENHighVoltageSell.Create();
            ENArresterObj.highvoltageSell.code :=
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

procedure TfrmENArresterEdit.spbENArresterSiteClick(Sender: TObject);
var frmENArresterSiteShow: TfrmENArresterSiteShow;
begin
  frmENArresterSiteShow := TfrmENArresterSiteShow.Create(Application,fmNormal);
  try
    with frmENArresterSiteShow do
      if ShowModal = mrOk then
        begin
          try
            if ENArresterObj.arresterSite = nil then
              ENArresterObj.arresterSite := ENArresterSite.Create();
            ENArresterObj.arresterSite.code :=
              StrToInt(GetReturnValue(sgENArresterSite,0));
            edtENArresterSiteName.Text := GetReturnValue(sgENArresterSite,1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmENArresterSiteShow.Free;
  end;
end;

procedure TfrmENArresterEdit.spbENLowVoltBoardClick(Sender: TObject);
var frmENLowVoltBoardShow: TfrmENLowVoltBoardShow;
begin
  frmENLowVoltBoardShow := TfrmENLowVoltBoardShow.Create(Application, fmNormal);
  try
    with frmENLowVoltBoardShow do
      if ShowModal = mrOk then
        begin
          try
            if ENArresterObj.lowVoltBoard = nil then
              ENArresterObj.lowVoltBoard := ENLowVoltBoard.Create();
              ENArresterObj.lowVoltBoard.code :=
                StrToInt(GetReturnValue(sgENLowVoltBoard,0));
              edtENLowVoltBoardName.Text :=
                GetReturnValue(sgENLowVoltBoard,1);
            except
              on EConvertError do Exit;
            end;
        end;
  finally
    frmENLowVoltBoardShow.Free;
  end;
end;

procedure TfrmENArresterEdit.spbTkMaterialsClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter; //Исключено объявление не используемых переменных
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
          if ENArresterObj.materialRef = nil then
            ENArresterObj.materialRef := TKMaterialsRef.Create;
          ENArresterObj.materialRef.code :=
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

end.